import "package:flutter/material.dart";

class InformationService {
  /// Abbreviated snackbar call
  /// 
  /// Removed current SnackBar and show new SnackBar
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }
}
