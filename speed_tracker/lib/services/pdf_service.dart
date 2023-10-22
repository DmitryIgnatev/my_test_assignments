import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:speed_tracker/services/generating_service.dart';
import 'package:speed_tracker/services/information_service.dart';
import 'dart:ui' as ui;

class PDFService {
  /// Convert image to Uint8List, that we can use in pdf
  Future<Uint8List> imageToUint8List(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return Uint8List(0);
    return byteData.buffer.asUint8List();
  }

  ///Method that create PDF with chart
  void createPDF(BuildContext context, ui.Image graph) async {
    final pdf = pw.Document();
    final customFont = await rootBundle.load("assets/fonts/Rubik-Regular.ttf");
    final rubikReg = pw.Font.ttf(customFont);
    Uint8List imageBytes = await imageToUint8List(graph);
    final image =
        pw.MemoryImage(await File('assets/pictures/speed.png').readAsBytes());
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Row(children: [
                  pw.SizedBox(
                    height: 50,
                    width: 50,
                    child: pw.Image(image),
                  ),
                  pw.Text('Приложение Speed Tracker',
                      style: pw.TextStyle(font: rubikReg, fontSize: 20)),
                ]),
                pw.SizedBox(height: 30),
                pw.Text(
                    'График изменения средней скорости в зависимости от отрезка времени',
                    style: pw.TextStyle(
                      font: rubikReg,
                      fontSize: 20,
                    ),
                    textAlign: pw.TextAlign.center),
                pw.SizedBox(height: 10),
                pw.Image(pw.MemoryImage(imageBytes)),
              ],
            ),
          );
        },
      ),
    );

    String filePath = await GeneratingService.getFilePath();
    final output = File('$filePath/example.pdf');
    try {
      final Uint8List bytes = await pdf.save();
      output.writeAsBytesSync(bytes);
      if (context.mounted) {
        InformationService.showSnackBar(
            context, "PDF файл успешно создан и сохранен в $filePath");
      }
      debugPrint('PDF файл успешно создан!');
    } catch (e) {
      if (context.mounted) {
        InformationService.showSnackBar(
            context, "Ошибка при создании PDF файла: $e'");
      }
      debugPrint('Ошибка при создании PDF файла: $e');
    }
  }
}
