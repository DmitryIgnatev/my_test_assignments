import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/components/my_text_styles.dart';
import '../../../../utils/theme/theme.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.5,
              color: isHovered ? ThemeColors.hoverButton : Colors.transparent,
            ),
          ),
          width: screenWidth * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/Icon_Download.svg',
                  colorFilter: const ColorFilter.mode(
                    ThemeColors.textH,
                    BlendMode.srcIn,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    "Скачать приложение",
                    style: MyTextStyles.desctopButtonDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
