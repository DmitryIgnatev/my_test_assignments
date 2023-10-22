import 'dart:math';

import 'package:flutter/material.dart';

/// Wave painter to draw the wave animation
class WavePainter extends CustomPainter {
  final double loadRate;
  final double waveValue;
  Color? waveColor = Colors.blue;

  WavePainter(this.loadRate, this.waveValue, {this.waveColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor!
      ..style = PaintingStyle.fill;

    final path = Path()..moveTo(0, size.height);

    // отрисовка волны
    for (var i = 0.0; i <= size.width; i++) {
      var waveHeight = 10.0; // амплитуда волны
      // уменьшение амплитуды волны при проценте выше 95 и ниже 5
      if (loadRate > 0.95) {
        waveHeight = (1 - loadRate) * 2 * 100;
      } else if (loadRate < 0.05) {
        waveHeight = loadRate * 2 * 100;
      }
      final y = (size.height - (size.height * loadRate)) +
          (waveHeight * sin(waveValue + 0.04 * i));
      path.lineTo(i, y);
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
