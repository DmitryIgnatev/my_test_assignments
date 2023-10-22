import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/theme/theme.dart';

class AuthButton extends StatefulWidget {
  final void Function()? onTap;
  const AuthButton({super.key, this.onTap});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      onTap: widget.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: isHovered ? ThemeColors.hoverButton : ThemeColors.mainButton,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
            child: Text(
          "Войти",
          style: GoogleFonts.rubik(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.03,
              color: ThemeColors.white),
        )),
      ),
    );
  }
}
