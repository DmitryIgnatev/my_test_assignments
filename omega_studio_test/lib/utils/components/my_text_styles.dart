import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme.dart';

///Text Styles for application
class MyTextStyles {
  static TextStyle desctopH6_23 = GoogleFonts.rubik(
      fontSize: 20, fontWeight: FontWeight.w500, color: ThemeColors.white);

  static TextStyle desctopText = GoogleFonts.rubik(
      height: 2,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.03,
      color: ThemeColors.cardBG);

  static TextStyle desctopButtonDark = GoogleFonts.rubik(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.03,
      color: ThemeColors.textH);

  static TextStyle desctopButtonLight = GoogleFonts.rubik(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.03,
      color: ThemeColors.white);

  static TextStyle desctopSmallText = GoogleFonts.rubik(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.03,
      color: ThemeColors.link);
}
