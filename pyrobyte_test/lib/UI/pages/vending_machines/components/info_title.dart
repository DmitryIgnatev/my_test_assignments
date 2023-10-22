import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  final String name;
  final String status;
  const InfoTitle({required this.name, required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: theme.textTheme.displayMedium,
          ),
          Text(
            status,
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
