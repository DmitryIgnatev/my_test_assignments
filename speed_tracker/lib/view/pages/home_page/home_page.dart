import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:speed_tracker/models/record_csv.dart';
import 'package:speed_tracker/services/file_service.dart';
import 'package:speed_tracker/services/pdf_service.dart';
import 'package:speed_tracker/utils/theme/theme_colors.dart';
import 'package:speed_tracker/view/pages/home_page/widgets/list_of_records.dart';
import 'package:speed_tracker/view/pages/home_page/widgets/speed_chart.dart';
import 'package:speed_tracker/view/pages/home_page/widgets/user_button.dart';

import '../../../blocs/records/bloc/records_bloc.dart';
import '../../../models/segments.dart';
import '../../../services/generating_service.dart';
import '../../widgets/app_bar.dart';
import 'widgets/segment_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String openedFileName = "";
  GlobalKey<_HomePageState> containerKey = GlobalKey<_HomePageState>();
  // Инициализируем GlobalKey
  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<RecordsBloc, RecordsState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: ThemeColors.backgoundColorDark,
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 0, screenWidth * 0.05, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        state.segments.isEmpty
                            ? const SizedBox()
                            : Column(
                                children: [
                                  RepaintBoundary(
                                      key: containerKey,
                                      child: SpeedChart(
                                          segmentList: state.userSegments)),
                                  const SegmentSelection()
                                ],
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: UserButton(
                                title: " Генерировать CSV",
                                onTap: () async {
                                  GeneratingService.generateCarMovementCSV(
                                      context);
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: UserButton(
                                title: "Открыть файл",
                                onTap: () async {
                                  File? openedFile =
                                      await FileService.pickFile();
                                  if (openedFile != null) {
                                    openedFileName = openedFile.path
                                        .split(RegExp("[\\\\/]"))
                                        .last;
                                    FileService.readFile(openedFile)
                                        .then((List<RecordCSV> result) {
                                      context.read<RecordsBloc>().add(
                                          RecordsChangedEvent(records: result));
                                      context.read<RecordsBloc>().add(
                                          SegmentsChangedEvent(
                                              segments: Segment
                                                  .calculateSegments(result)));
                                      context.read<RecordsBloc>().add(
                                          UserSegmentsChangedEvent(
                                              userSegments: Segment
                                                  .calculateSegments(result)));
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        state.records.isNotEmpty
                            ? UserButton(
                                title: "Создать PDF",
                                onTap: () async {
                                  debugPrint(
                                      "Context : ${containerKey.currentContext}");
                                  ui.Image? imageFromContainer =
                                      await GeneratingService.widgetToImage(
                                          containerKey, const SizedBox());
                                  if (context.mounted) {
                                    PDFService().createPDF(
                                        context, imageFromContainer!);
                                  }
                                },
                              )
                            : const SizedBox(),
                        state.records.isNotEmpty
                            ? UserButton(
                                title: "Закрыть файл",
                                onTap: () {
                                  openedFileName = "";
                                  context.read<RecordsBloc>().add(
                                      const RecordsChangedEvent(records: []));
                                  context.read<RecordsBloc>().add(
                                      const SegmentsChangedEvent(segments: []));
                                  context.read<RecordsBloc>().add(
                                      const UserSegmentsChangedEvent(
                                          userSegments: []));
                                },
                              )
                            : const SizedBox(),
                        screenWidth < 600
                            ? ListOfRecords(
                                records: state.records,
                                openedFileName: openedFileName,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  screenWidth > 600
                      ? Row(
                          children: [
                            const SizedBox(width: 10),
                            ListOfRecords(
                              records: state.records,
                              openedFileName: openedFileName,
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ));
    });
  }
}
