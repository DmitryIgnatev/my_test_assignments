import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/theme/theme.dart';

class PasswordLink extends StatefulWidget {
  const PasswordLink({super.key});

  @override
  State<PasswordLink> createState() => _PasswordLinkState();
}

class _PasswordLinkState extends State<PasswordLink> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Забыли пароль?",
              style: GoogleFonts.rubik(
                color: isHovered ? ThemeColors.linkHover : ThemeColors.link,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.03,
                decoration: TextDecoration.underline,
                decorationColor:
                    isHovered ? ThemeColors.linkHover : ThemeColors.link,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
