part of 'theme.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: tmnUltraLightBlue, // appBackground color
  primaryColor: tmnBlue, // Primary app element color 
  cardColor: tmnWhite, // card and modal bottom sheet color
  hintColor: tmnLightGrey,
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: tmnDarkGrey,
    ),
    headlineLarge: GoogleFonts.jost(
      fontWeight: FontWeight.w700,
      fontSize: 40,
      color: tmnDarkGrey,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: tmnDarkGrey,
    ),
    headlineSmall: GoogleFonts.jost(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: tmnDarkGrey,
    ),
    titleLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: tmnDarkGrey,
    ),
    titleMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: tmnDarkGrey,
    ),
    titleSmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: tmnDarkGrey,
    ),
    displayMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: tmnMidGrey,
    ),
    displaySmall: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: tmnMidGrey,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>{
    BorderButtonFonts(
      borderedButtonSmall: GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: tmnBlue,
      ),
      borderedButtonMedium: GoogleFonts.jost(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: tmnBlue,
      ),
      borderedButtonLarge: GoogleFonts.jost(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: tmnBlue,
      ),
    ),
    CardFonts(
      time: GoogleFonts.jost(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: tmnDarkGrey.withOpacity(0.14),
      ),
      message: GoogleFonts.jost(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: tmnDarkGrey,
      ),
      additionalInfoSmall: GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: tmnLightGrey,
      ),
      additionalInfoMedium: GoogleFonts.jost(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: tmnDarkGrey,
      ),
    ),
    BottomSheetFonts(
      activeButtonSmall: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w300, color: tmnWhite),
      supportingTextSmall: GoogleFonts.jost(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: tmnMidGrey,
      ),
      textFieldInactive: GoogleFonts.jost(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: tmnLightGrey,
      ),
      activeButtonMeduim: GoogleFonts.jost(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: tmnDarkGrey,
      ),
    )
  },
);
