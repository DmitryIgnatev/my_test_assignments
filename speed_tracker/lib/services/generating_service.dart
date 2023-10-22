import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speed_tracker/services/information_service.dart';

class GeneratingService {
  /// We get the path in which we will save files depending on the platform
  static Future<String> getFilePath() async {
    if (Platform.isAndroid) {
      Directory? directory = await getExternalStorageDirectory();
      return directory!.path;
    } else {
      Directory? directory = await getDownloadsDirectory();
      return directory!.path;
    }
  }

  /// Generating the movement of an object, which is recorded in a CSV file
  static Future<void> generateCarMovementCSV(BuildContext context) async {
    List<List<dynamic>> carMovementData = [];

    // Изначальная точка и время
    // Initial point and time
    double initialLatitude = 55.7647;
    double initialLongitude = 37.2421;
    DateTime initialTime = DateTime(2023, 7, 20, 14, 0, 0);

    for (int i = 0; i < 12; i++) {
      Random random = Random();
      double randomValue = (random.nextDouble() * 0.02) - 0.01;
      double latitude = initialLatitude + randomValue;
      double longitude = initialLongitude + randomValue;

      DateTime currentTime = initialTime.add(Duration(minutes: i));
      String formattedTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);

      List<dynamic> record = [i, '$latitude,$longitude', formattedTime];
      carMovementData.add(record);
    }

    String csvData = const ListToCsvConverter().convert(carMovementData);

    String filePath = await GeneratingService.getFilePath();
    await File("$filePath/object_movement_data.csv").writeAsString(csvData);

    if (context.mounted) {
      InformationService.showSnackBar(context,
          'CSV-файл успешно сгенерирован и сохранен по пути: $filePath');
    }
  }

  /// Method that allows to convert any widget into an image that can later be used in pdf
  static Future<ui.Image?> widgetToImage(
      GlobalKey containerKey, Widget widget) async {
    final RenderRepaintBoundary boundary = containerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      final codec =
          await ui.instantiateImageCodec(byteData.buffer.asUint8List());
      final frame = await codec.getNextFrame();
      return frame.image;
    }

    return null;
  }
}
