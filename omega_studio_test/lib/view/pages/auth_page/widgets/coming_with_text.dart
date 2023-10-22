import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class ComingWithText extends StatelessWidget {
  const ComingWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(color: ThemeColors.textP),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Или войдите с помощью:",
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.03,
                color: ThemeColors.textP),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(color: ThemeColors.textP),
          ),
        ),
      ],
    );
  }
}
