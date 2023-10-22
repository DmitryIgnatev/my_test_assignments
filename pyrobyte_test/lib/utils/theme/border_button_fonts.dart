part of 'theme.dart';

/// TextStyles for custom border buttons
class BorderButtonFonts extends ThemeExtension<BorderButtonFonts> {
  final TextStyle borderedButtonSmall;
  final TextStyle borderedButtonMedium;
  final TextStyle borderedButtonLarge;

  const BorderButtonFonts({
    required this.borderedButtonSmall,
    required this.borderedButtonMedium,
    required this.borderedButtonLarge,
  });

  @override
  ThemeExtension<BorderButtonFonts> copyWith({
    TextStyle? borderedButtonSmall,
    TextStyle? borderedButtonMedium,
    TextStyle? borderedButtonLarge,
  }) {
    return BorderButtonFonts(
      borderedButtonSmall: borderedButtonSmall ?? this.borderedButtonSmall,
      borderedButtonMedium: borderedButtonMedium ?? this.borderedButtonMedium,
      borderedButtonLarge: borderedButtonLarge ?? this.borderedButtonLarge,
    );
  }

  @override
  ThemeExtension<BorderButtonFonts> lerp(
    ThemeExtension<BorderButtonFonts>? other,
    double t,
  ) {
    if (other is! BorderButtonFonts) {
      return this;
    }

    return BorderButtonFonts(
      borderedButtonSmall:
          TextStyle.lerp(borderedButtonSmall, other.borderedButtonSmall, t)!,
      borderedButtonMedium:
          TextStyle.lerp(borderedButtonMedium, other.borderedButtonMedium, t)!,
      borderedButtonLarge:
          TextStyle.lerp(borderedButtonLarge, other.borderedButtonLarge, t)!,
    );
  }
}
