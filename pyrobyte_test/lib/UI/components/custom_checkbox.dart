import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final Color borderColor;
  final Color checkBoxColor;
  final double size;
  final void Function() onTap;
  const CustomCheckBox(
      {required this.value,
      required this.onTap,
      super.key,
      this.borderColor = tmnLightBlue,
      this.checkBoxColor = tmnDarkGrey,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(border: Border.all(color: borderColor)),
        child: Stack(
          children: [
            if (value)
              Center(
                child: SvgPicture.asset(
                  height: size - 10,
                  width: size - -10,
                  'assets/icons/check.svg',
                  colorFilter: ColorFilter.mode(checkBoxColor, BlendMode.srcIn),
                ),
              )
          ],
        ),
      ),
    );
  }
}
