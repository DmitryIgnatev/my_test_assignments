import 'package:flutter/material.dart';

class UserButton extends StatefulWidget {
  final void Function()? onTap;
  final String title;
  const UserButton({super.key, this.onTap, required this.title});

  @override
  State<UserButton> createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        onTap: widget.onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: isHovered
                  ? Colors.blue
                  : const Color.fromARGB(255, 145, 145, 145),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.03,
                color: Colors.white),
          )),
        ),
      ),
    );
  }
}
