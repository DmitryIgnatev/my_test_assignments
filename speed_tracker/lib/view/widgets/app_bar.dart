import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_tracker/utils/theme/theme_colors.dart';

PreferredSizeWidget appBar() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: ThemeColors.backgoundColorDark,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 0, 8),
      child: Image.asset("assets/pictures/speed.png"),
    ),
    title: const Text("Speed Tracker"),
  );
}
