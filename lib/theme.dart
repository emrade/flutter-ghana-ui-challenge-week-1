
import 'package:flutter/material.dart';
import 'utils/utils.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(fontFamily: AvailableFonts.primaryFont);

  return baseTheme.copyWith(
    primaryColor: CustomColors.primaryColor,
    appBarTheme: AppBarTheme(color: CustomColors.appBarColor)
  );
}
