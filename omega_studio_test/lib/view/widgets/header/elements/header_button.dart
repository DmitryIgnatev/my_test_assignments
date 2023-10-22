import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class HeaderButton extends StatefulWidget {
  const HeaderButton({super.key, required this.assetName, required this.buttonText});
  final String assetName;
  final String buttonText;

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 5),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.assetName,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                    ThemeColors.violetHard, BlendMode.srcIn),
              ),

              Text(
                widget.buttonText,
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.03,
                    color: isHovered
                        ? ThemeColors.violetHard
                        : ThemeColors.textH),
              )
            ],
          ),
        ),
      ),
    );
  }
}
