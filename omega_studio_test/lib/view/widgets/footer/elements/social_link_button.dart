import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/theme/theme.dart';

class SocialLinkButton extends StatefulWidget {
  const SocialLinkButton({super.key, required this.assetName});
  final String assetName;

  @override
  State<SocialLinkButton> createState() => _SocialLinkButtonState();
}

class _SocialLinkButtonState extends State<SocialLinkButton> {
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
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              width: 1.5,
              color: isHovered ? ThemeColors.hoverButton : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              widget.assetName,
              width: 22,
              height: 22,
              colorFilter:
                  const ColorFilter.mode(ThemeColors.textH, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
