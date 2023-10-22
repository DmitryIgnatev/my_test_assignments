import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pyrobyte_test/UI/components/finance_card.dart';
import 'package:pyrobyte_test/domain/models/finance_item.dart';

class Finance extends StatelessWidget {
  const Finance({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization!.finance,
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: width,
          height: 72,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                final financeItem = finances[index];
                return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FinanceCard(
                      type: financeItem.type,
                      message: financeItem.message,
                      price: '${financeItem.price}',
                    ));
              }),
        ),
      ],
    );
  }
}

List<FinanceItem> finances = [
  FinanceItem(price: 5700, message: 'Деньги в ТА', type: 'money'),
  FinanceItem(price: 1255, message: 'Сдача', type: 'cashback'),
  FinanceItem(price: 7000, message: 'Деньги в ТА', type: 'money'),
];
