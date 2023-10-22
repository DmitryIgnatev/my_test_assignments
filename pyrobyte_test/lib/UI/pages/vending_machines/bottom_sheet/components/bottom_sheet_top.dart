import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/states/bottom_sheet_state.dart';
import 'package:pyrobyte_test/utils/di.dart';

class BottomSheetTop extends StatefulWidget {
  const BottomSheetTop({super.key});

  @override
  State<BottomSheetTop> createState() => _BottomSheetTopState();
}

class _BottomSheetTopState extends State<BottomSheetTop> {
  final state = serviceLocator<BottomSheetState>();
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localization!.loading,
          style: theme.textTheme.headlineMedium,
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
              state.cleanState();
            },
            child: SvgPicture.asset('assets/icons/close.svg'))
      ],
    );
  }
}
