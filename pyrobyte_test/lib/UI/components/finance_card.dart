import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class FinanceCard extends StatelessWidget {
  final String type;
  final String message;
  final String price;
  const FinanceCard(
      {required this.type,
      required this.message,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: theme.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SvgPicture.asset(type == 'money'
                ? 'assets/images/money.svg'
                : 'assets/images/cashback.svg'),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '$price ',
                      style: theme.extension<CardFonts>()!.message,
                    ),
                    SvgPicture.asset('assets/icons/rouble.svg')
                  ],
                ),
                Text(
                  message,
                  style: theme.extension<CardFonts>()!.additionalInfoMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
