import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class EventCard extends StatelessWidget {
  final String time;
  final String message;
  final String? info;
  final double cardHeight;
  final Color cardMessageColor;
  const EventCard(
      {required this.time,
      required this.message,
      super.key,
      this.cardHeight = 48.0,
      this.cardMessageColor = tmnRed,
      this.info});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
      child: Container(
        width: width,
        height: cardHeight,
        decoration: BoxDecoration(color: theme.cardColor),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: cardHeight,
                  width: 2,
                  decoration: BoxDecoration(
                    color: cardMessageColor,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      time,
                      style: theme.extension<CardFonts>()!.time,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: theme.extension<CardFonts>()!.message,
                    ),
                    if (info != null)
                      Text(
                        info ?? localization!.error,
                        style: theme.extension<CardFonts>()!.additionalInfoSmall,
                      )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  'assets/icons/arrow_1.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
