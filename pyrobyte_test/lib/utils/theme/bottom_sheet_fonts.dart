part of 'theme.dart';

/// TextStyles, that used in app ModalBottomSheet
class BottomSheetFonts extends ThemeExtension<BottomSheetFonts> {
  final TextStyle activeButtonSmall;
  final TextStyle supportingTextSmall;
  final TextStyle textFieldInactive;
  final TextStyle activeButtonMeduim;

  const BottomSheetFonts({
    required this.activeButtonSmall,
    required this.supportingTextSmall,
    required this.textFieldInactive,
    required this.activeButtonMeduim,
  });

  @override
  ThemeExtension<BottomSheetFonts> copyWith({
    TextStyle? activeButtonSmall,
    TextStyle? supportingTextSmall,
    TextStyle? textFieldInactive,
    TextStyle? activeButtonMeduim,
  }) {
    return BottomSheetFonts(
      activeButtonSmall: activeButtonSmall ?? this.activeButtonSmall,
      supportingTextSmall: supportingTextSmall ?? this.supportingTextSmall,
      textFieldInactive: textFieldInactive ?? this.textFieldInactive,
      activeButtonMeduim: activeButtonMeduim ?? this.activeButtonMeduim,
    );
  }

  @override
  ThemeExtension<BottomSheetFonts> lerp(
    ThemeExtension<BottomSheetFonts>? other,
    double t,
  ) {
    if (other is! BottomSheetFonts) {
      return this;
    }

    return BottomSheetFonts(
      activeButtonSmall:
          TextStyle.lerp(activeButtonSmall, other.activeButtonSmall, t)!,
      supportingTextSmall:
          TextStyle.lerp(supportingTextSmall, other.supportingTextSmall, t)!,
      textFieldInactive:
          TextStyle.lerp(textFieldInactive, other.textFieldInactive, t)!,
      activeButtonMeduim:
          TextStyle.lerp(activeButtonMeduim, other.activeButtonMeduim, t)!,
    );
  }
}
