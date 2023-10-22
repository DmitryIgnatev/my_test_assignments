import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class EntranceText extends StatelessWidget {
  const EntranceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Вход",
        style: GoogleFonts.rubik(
            fontSize: 39,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.01,
            color: ThemeColors.textH));
  }
}
