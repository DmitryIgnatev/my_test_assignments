import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class RegistrationLink extends StatefulWidget {
  const RegistrationLink({Key? key}) : super(key: key);

  @override
  State<RegistrationLink> createState() => _RegistrationLinkState();
}

class _RegistrationLinkState extends State<RegistrationLink> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            "Еще нет аккаунта? ",
            style: GoogleFonts.rubik(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.03,
              color: ThemeColors.textP,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: InkWell(
            onHover: (value) {
              setState(() {
                isHovered = value;
              });
            },
            onTap: () {},
            child: Text(
              "Зарегистрируйтесь",
              style: GoogleFonts.rubik(
                color: isHovered ? ThemeColors.linkHover : ThemeColors.link,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.03,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
