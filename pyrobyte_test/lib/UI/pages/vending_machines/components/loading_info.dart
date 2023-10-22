import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pyrobyte_test/UI/components/bordered_button.dart';
import 'package:pyrobyte_test/UI/components/wave_painter.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class LoadingInfo extends StatefulWidget {
  const LoadingInfo({super.key});

  @override
  State<LoadingInfo> createState() => _LoadingInfoState();
}

class _LoadingInfoState extends State<LoadingInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward(); // Animation started
    _waveAnimation =
        Tween<double>(begin: 0, end: 2 * 3.141592).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose(); //animation closed
    super.dispose();
  }

  //Percentages for how much is loaded
  //The wave height depends on this variable
  final double loadPercents = 70;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: const Size(1000, 1000),
                      painter: WavePainter(
                          loadPercents / 100, _waveAnimation.value,
                          waveColor: tmnBlue.withOpacity(0.48)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        '${loadPercents ~/ 1}%',
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Text(
                          localization!.current_load_level,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BorderedButton(
                  child: SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          localization.loading,
                          textAlign: TextAlign.center,
                          style: theme
                              .extension<BorderButtonFonts>()!
                              .borderedButtonMedium,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                BorderedButton(
                  child: SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          localization.inventory,
                          textAlign: TextAlign.center,
                          style: theme
                              .extension<BorderButtonFonts>()!
                              .borderedButtonMedium,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
