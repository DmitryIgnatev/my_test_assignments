part of 'theme.dart';

/// Extextded TextStyles for vending machine cards
class CardFonts extends ThemeExtension<CardFonts> {
  final TextStyle time;
  final TextStyle message;
  final TextStyle additionalInfoSmall;
  final TextStyle additionalInfoMedium;

  const CardFonts({
    required this.time,
    required this.message,
    required this.additionalInfoSmall,
    required this.additionalInfoMedium,
  });

  @override
  ThemeExtension<CardFonts> copyWith({
    TextStyle? time,
    TextStyle? message,
    TextStyle? additionalInfoSmall,
    TextStyle? additionalInfoMedium,
  }) {
    return CardFonts(
      time: time ?? this.time,
      message: message ?? this.message,
      additionalInfoSmall: additionalInfoSmall ?? this.additionalInfoSmall,
      additionalInfoMedium: additionalInfoMedium ?? this.additionalInfoMedium,
    );
  }

  @override
  ThemeExtension<CardFonts> lerp(
    ThemeExtension<CardFonts>? other,
    double t,
  ) {
    if (other is! CardFonts) {
      return this;
    }

    return CardFonts(
      time: TextStyle.lerp(time, other.time, t)!,
      message: TextStyle.lerp(message, other.message, t)!,
      additionalInfoSmall:
          TextStyle.lerp(additionalInfoSmall, other.additionalInfoSmall, t)!,
      additionalInfoMedium:
          TextStyle.lerp(additionalInfoMedium, other.additionalInfoMedium, t)!,
    );
  }
}
