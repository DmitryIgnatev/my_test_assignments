import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/theme/theme.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, this.onChanged, required this.errorText});
  final String errorText;
  final void Function(String)? onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: widget.onChanged,
          keyboardType: TextInputType.text,
          cursorColor: ThemeColors.textP,
          style: GoogleFonts.rubik(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.03,
              color: ThemeColors.textP),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/svg/Icon_Search.svg',
                colorFilter: ColorFilter.mode(
                  isHovered ? ThemeColors.violetHard : ThemeColors.violetLight,
                  BlendMode.srcIn,
                ),
              ),
            ),
            hintText: widget.errorText.isEmpty ? "Поиск" : widget.errorText,
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
            hintStyle: TextStyle(
              color: isHovered ? ThemeColors.textP : ThemeColors.violetLight,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
