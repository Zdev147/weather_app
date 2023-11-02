import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ThemeHelper {

  PrimaryColors _getThemeColors() {
    return PrimaryColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.primaryColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      dividerTheme: DividerThemeData(
        thickness: 42,
        space: 42,
        color: appTheme.gray400,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 15.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 30.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 15.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray900 => Color(0XFF2C2C2C);

  // Gray
  Color get gray400 => Color(0xFFC4C4C4);
  Color get gray500 => Color(0XFF9A9A9A);
  Color get gray5001 => Color(0xfff1f1f1);

  // Indigo
  Color get indigo900 => Color(0XFF001F6F);

  // LightBlue
  Color get lightBlue200 => Color(0XFF7CC9F2);

  // Orange
  Color get orangeA200 => Color(0XFFFFAC33);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
