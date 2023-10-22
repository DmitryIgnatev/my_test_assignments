import 'package:flutter/material.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

class CustomTextInput extends StatelessWidget {
  final int? maxLength;
  final String hintText;
  const CustomTextInput({super.key, this.hintText = '', this.maxLength});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextField(
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintStyle: theme.extension<BottomSheetFonts>()!.textFieldInactive,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.hintColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.hintColor,
              ),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
