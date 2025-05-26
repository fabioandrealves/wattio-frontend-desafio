import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle headerTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
  }) => TextStyle(fontSize: fontSize, letterSpacing: 0, fontWeight: fontWeight);

  static TextStyle textDarkOnSurface({
    required double fontSize,
    required FontWeight fontWeight,
  }) => TextStyle(fontSize: fontSize, letterSpacing: 0, fontWeight: fontWeight);

  static TextStyle energyAppButtonTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) => TextStyle(
    fontSize: fontSize,
    letterSpacing: 0,
    fontWeight: fontWeight,
    color: color,
  );

  static TextStyle offerCardNameTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) => TextStyle(
    fontSize: fontSize,
    letterSpacing: 0,
    fontWeight: fontWeight,
    color: color,
  );
  static TextStyle offerCardDiscountTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) => TextStyle(
    fontSize: fontSize,
    letterSpacing: 0,
    fontWeight: fontWeight,
    color: color,
  );
}
