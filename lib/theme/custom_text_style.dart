import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {

  static get bodySmallGray50012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 12.fSize,
      );


  // Poppins text style
  static get poppinsBluegray900 => TextStyle(
        color: appTheme.blueGray900,
        fontSize: 70.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsGray400 => TextStyle(
        color: appTheme.gray400,
        fontSize: 75.fSize,
        fontWeight: FontWeight.w600,
      ).poppins;
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
