import 'package:flutter/material.dart';

import '../../../../utils/theme/theme.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        onTap: () {},
        child: Icon(
          Icons.menu,
          color: isHovered ? ThemeColors.hoverButton : ThemeColors.violetHard,
        ),
      ),
    );
  }
}
