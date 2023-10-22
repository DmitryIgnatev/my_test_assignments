import 'package:flutter/material.dart';


class BorderedButton extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final Widget? child;
  const BorderedButton(
      {super.key, this.borderColor = Colors.blue, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: child,
      ),
    );
  }
}
