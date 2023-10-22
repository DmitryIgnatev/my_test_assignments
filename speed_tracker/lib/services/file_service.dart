import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../models/record_csv.dart';

class FileService {
  // Метод для открытия файла
  // Method for pick the file
  static Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null; // Return null if the file was not selected
    }
  }

  // Метод для считывания данных из открытого файла
  /// Method for reading data from an open file
  static Future<List<RecordCSV>> readFile(File file) async {
    try {
      List<String> lines = await file.readAsLines();
      List<RecordCSV> records = [];
      for (int i = 0; i < lines.length; i++) {
        RecordCSV record = RecordCSV.fromCsv(lines[i]);
        records.add(record);
      }
      return records;
    } catch (e) {
      debugPrint('Error reading file: $e');
      return []; // Return an empty list in case of a file reading error
    }
  }
}
