import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class BottomSheetMessage extends StatelessWidget {
  const BottomSheetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      width: width,
      decoration: const BoxDecoration(
          color: tmnlightGreen,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/check.svg'),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: width * 0.7,
              child: Text('Изменения от 12.07.2021, 12:30 применены успешно',
                  style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
