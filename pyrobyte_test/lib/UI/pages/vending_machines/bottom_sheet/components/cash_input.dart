import 'package:flutter/material.dart';
import 'package:pyrobyte_test/UI/components/custom_text_input.dart';

class CashInput extends StatelessWidget {
  const CashInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Decimal position',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 10,),
        const Row(
          children: [
            CustomTextInput(
              hintText: 'Cash',
            ),
            SizedBox(
              width: 10,
            ),
            CustomTextInput(
              hintText: 'Cashless',
            )
          ],
        ),
        const SizedBox(height: 10,),
        Text(
          'Text factor',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 10,),
        const Row(
          children: [
            CustomTextInput(
              hintText: 'Cash',
            ),
            SizedBox(
              width: 10,
            ),
            CustomTextInput(
              hintText: 'Cashless',
            )
          ],
        ),
      ],
    );
  }
}
