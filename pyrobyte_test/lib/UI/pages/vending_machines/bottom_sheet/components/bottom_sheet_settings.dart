import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pyrobyte_test/UI/components/custom_checkbox.dart';
import 'package:pyrobyte_test/UI/components/custom_switch.dart';
import 'package:pyrobyte_test/states/bottom_sheet_state.dart';
import 'package:pyrobyte_test/utils/di.dart';

class BottomSheetSettings extends StatefulWidget {
  const BottomSheetSettings({super.key});

  @override
  State<BottomSheetSettings> createState() => _BottomSheetSettingsState();
}

class _BottomSheetSettingsState extends State<BottomSheetSettings> {
  final state = serviceLocator<BottomSheetState>();
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Observer(
        builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                        onTap: state.changeSoundStatus, value: state.isSoundOn),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      localization!.sound_on,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(localization.master_mode,
                    style: theme.textTheme.titleMedium),
                const SizedBox(
                  height: 15,
                ),
                CustomSwitch(
                  onLeftTap: () {
                    state.isMasterMode = true;
                  },
                  onRightTap: () {
                    state.isMasterMode = false;
                  },
                  leftText: localization.used,
                  rightText: localization.unused,
                  value: state.isMasterMode,
                  width: width,
                ),
              ],
            ));
  }
}
