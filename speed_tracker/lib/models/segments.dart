import 'package:flutter/material.dart';
import 'package:speed_tracker/models/record_csv.dart';

import '../services/calculate_service.dart';

/// Class for representing segments that are derived from CSV files
class Segment {
  final int id;
  final double distanceKM;
  final int timeMin;

  Segment(this.id, this.distanceKM, this.timeMin);

  /// Method that converts the list from List<RecordCSV> to List<Segment>
  /// 
  /// This is done for a more convenient representation of data on the chart
  static List<Segment> calculateSegments(List<RecordCSV> result) {
    double distance = 0;
    List<Segment> segmentList = [];
    Duration difference = const Duration(minutes: 0);

    for (var i = 0; i < result.length - 1; i++) {
      distance += CalculateService().calculateDistance(result[i].latitude,
          result[i].longitude, result[i + 1].latitude, result[i + 1].longitude);

      difference += result[i + 1].dateTime.difference(result[i].dateTime);

      segmentList.add(Segment(i, distance, difference.inMinutes));
      debugPrint(
          "ID: ${segmentList[i].id} distance: ${segmentList[i].distanceKM} duration: ${segmentList[i].timeMin}");
    }
    return segmentList;
  }
}
