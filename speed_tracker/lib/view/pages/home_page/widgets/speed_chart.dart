import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../models/segments.dart';
import '../../../../services/calculate_service.dart';

class SpeedChart extends StatefulWidget {
  final List<Segment> segmentList;
  const SpeedChart({super.key, required this.segmentList});

  @override
  State<SpeedChart> createState() => _SpeedChartState();
}

class _SpeedChartState extends State<SpeedChart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      height: screenWidth * 0.4,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            minX: 0,
            maxX: widget.segmentList.length.toDouble() - 1,
            minY: 0,
            maxY: widget.segmentList
                    .map(CalculateService.calculateAverageSpeed)
                    .reduce((a, b) => a > b ? a : b) +
                10,
            lineBarsData: [
              LineChartBarData(
                spots: widget.segmentList.asMap().entries.map((entry) {
                  int x = entry.key;
                  Segment segment = entry.value;
                  return FlSpot(x.toDouble(),
                      CalculateService.calculateAverageSpeed(segment));
                }).toList(),
                isCurved: true,
                color: Colors.blue,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
