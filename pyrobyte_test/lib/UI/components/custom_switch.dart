import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class CustomSwitch extends StatelessWidget {
  final void Function() onLeftTap;
  final void Function() onRightTap;
  final Color widgetColor;
  final bool value;
  final double width;
  final String leftText;
  final String rightText;
  const CustomSwitch({
    required this.value,
    required this.onLeftTap,
    required this.onRightTap,
    super.key,
    this.width = 50,
    this.widgetColor = tmnBlue,
    this.leftText = '',
    this.rightText = '',
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: 40,
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: onLeftTap,
            child: Container(
              decoration: BoxDecoration(
                  color: value ? widgetColor : Colors.transparent,
                  border: Border.all(color: widgetColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
              height: height,
              child: Center(
                child: Text(
                  leftText,
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: value ? tmnWhite : widgetColor),
                ),
              ),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: onRightTap,
            child: Container(
              decoration: BoxDecoration(
                  color: value ? Colors.transparent : widgetColor,
                  border: Border.all(color: widgetColor),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )),
              height: height,
              child: Center(
                child: Text(
                  rightText,
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: !value ? tmnWhite : widgetColor),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
