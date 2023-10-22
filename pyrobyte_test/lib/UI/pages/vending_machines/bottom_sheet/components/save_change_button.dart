import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class SaveChangeButton extends StatelessWidget {
  const SaveChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 25),
        child: Container(
          height: 56,
          decoration: const BoxDecoration(
            color: tmnBlue,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
              child: Text(
            localization!.save_change,
            style: GoogleFonts.jost(
                fontSize: 16, fontWeight: FontWeight.w500, color: tmnWhite),
          )),
        ),
      ),
    );
  }
}
