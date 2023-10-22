import 'package:flutter/material.dart';

import '../../../../models/record_csv.dart';
import '../../../../utils/style/text_styles.dart';

class ListOfRecords extends StatelessWidget {
  final String openedFileName;
  final List<RecordCSV> records;
  const ListOfRecords(
      {super.key, required this.records, required this.openedFileName});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenWidth > 600 ? 300 : screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Записи из файла $openedFileName",
              style: TextStyles.title,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: records.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromARGB(255, 112, 112, 112)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                " ID: ",
                                style: TextStyles.positionInfoTitle,
                              ),
                              Text(
                                "${records[index].id} ",
                                style: TextStyles.positionInfoText,
                              ),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                const Text(
                                  "Дата и время записи",
                                  style: TextStyles.positionInfoTitle,
                                ),
                                Text(
                                  "${records[index].dateTime} ",
                                  style: TextStyles.positionInfoText,
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Долгота ",
                                    style: TextStyles.positionInfoTitle,
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 17,
                                      child: Text("${records[index].latitude} ",
                                          style: TextStyles.positionInfoText)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Широта ",
                                    style: TextStyles.positionInfoTitle,
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 17,
                                      child: Text(
                                        "${records[index].longitude}",
                                        style: TextStyles.positionInfoText,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          ],
        ));
  }
}
