import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField(
      {super.key,
      this.onChanged,
      required this.hintText,
      required this.isEmail,
      required this.errorText});
  final String hintText;
  final String errorText;
  final bool isEmail;
  final void Function(String)? onChanged;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: TextField(
        cursorColor: ThemeColors.textP,
        onChanged: widget.onChanged,
        obscureText: !widget.isEmail,
        keyboardType: widget.isEmail
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        style: GoogleFonts.rubik(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.03,
            color: ThemeColors.textP),
        decoration: InputDecoration(
          labelText:
              widget.errorText.isEmpty ? widget.hintText : widget.errorText,
          labelStyle: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.03,
              color: isHovered ? ThemeColors.textP : ThemeColors.violetLight),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: widget.errorText.isEmpty
                    ? ThemeColors.violetHard
                    : ThemeColors.no),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.errorText.isEmpty
                    ? isHovered
                        ? ThemeColors.violetHard
                        : ThemeColors.violetLight
                    : ThemeColors.no),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
