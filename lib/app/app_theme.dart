part of 'app.dart';

ThemeData getAppTheme() {
  final textTheme = GoogleFonts.pressStart2pTextTheme(const TextTheme(
      titleMedium: TextStyle(
          color: Colors.white
      ),
      headlineMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white)
  ));

  // const textTheme = TextTheme(
  //   titleMedium: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   headlineMedium: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'SBSansText'),
  //   bodyMedium: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'SBSansText'),
  //   bodySmall: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'SBSansText'),
  //   displayLarge: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   displayMedium: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   displaySmall: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   headlineLarge: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   headlineSmall: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   titleLarge: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   titleSmall: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   bodyLarge: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   labelLarge: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   labelMedium: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  //   labelSmall: TextStyle(color: Colors.white, fontFamily: 'SBSansText'),
  // );

  final backgroundColor = Color(0xFF282828);

  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: textTheme,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
      filled: true,
      fillColor: Color(0x33FFFFFF),
      labelStyle: TextStyle(
          color: Color(0x80FFFFFF)
      ),
      floatingLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: 16
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
            color: Color(0x80FFFFFF),
            width: 4.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
            color: Colors.white, width: 6.0),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.headlineMedium,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero),
        backgroundColor: Color(0xFF909FFF),
        foregroundColor: Colors.white
      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero),
      backgroundColor: backgroundColor
    )
  );
}