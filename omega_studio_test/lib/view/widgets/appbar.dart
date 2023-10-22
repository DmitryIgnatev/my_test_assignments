import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/theme.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color (in Figma status bar is white)
      statusBarColor: ThemeColors.white,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    //Heigh is 0 for not to overlap the header
    toolbarHeight: 0,
  );
}
