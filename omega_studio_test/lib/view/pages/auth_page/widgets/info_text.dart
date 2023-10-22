import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Введите данные, чтобы войти в личный кабинет.",
      style: GoogleFonts.rubik(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.03,
          color: ThemeColors.textP),
    );
  }
}
