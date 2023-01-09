import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

// Change colors here, it will effect the whole app!!!
// You can use the tool: https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
// under "Color variations for accessibility" you can generate your own color!!!
class CustomTheme {
  static final BehaviorSubject<ThemeMode> _currentTheme =
      BehaviorSubject<ThemeMode>.seeded(ThemeMode.dark);
  static BehaviorSubject<ThemeMode> observerTheme() {
    return _currentTheme;
  }

  static setTheme(ThemeMode mode) {
    return _currentTheme.add(mode);
  }

  static const animationDuration = Duration(milliseconds: 300);
  static final darkThemeConfig = ThemeData.dark().copyWith(
    primaryColor: const Color(0xff00b863),
    backgroundColor: const Color(0xff181a21),
    disabledColor: Colors.white.withOpacity(0.05),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff00b863), // header background color
      onPrimary: Colors.black, // header text color
      onSurface: Colors.green, // body text color
    ),
    shadowColor: Colors.black38,
    cardColor: Colors.white.withOpacity(0.07),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
    ).apply(
      fontFamily: GoogleFonts.urbanist().fontFamily,
      displayColor: Colors.white,
      bodyColor: Colors.white,
      decorationColor: Colors.white,
    ),
  );
  static final lightThemeConfig = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: const Color(0xff00b863),
    canvasColor: const Color(0xfffbfbfb),
    disabledColor: const Color(
      0xfff5f5f5,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff00b863),
      onPrimary: Colors.black,
      onSurface: Colors.green,
    ),
    shadowColor: Colors.black26,
    focusColor: const Color(0xffebfaf3),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
    ).apply(
      fontFamily: GoogleFonts.urbanist().fontFamily,
      displayColor: Colors.black,
      bodyColor: Colors.black,
      decorationColor: Colors.black,
    ),
  );
}
