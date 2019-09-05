import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppConstants {
  static const appName = "Flutter Ghana UI Challenge Week 1";
}

class AppTextStyles {
  static const headerTextStyle = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.headerTextColor
  );

  static const subHeaderTextStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  static const descriptionTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const unselectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const selectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: CustomColors.primaryColor,
  );
}

class AvailableFonts {
  static const primaryFont = "Quicksand";
}

class AvailableImages {
  static const hamburger = 'assets/images/hamburger.png';
  static const assassin = 'assets/images/assassin.jpg';
  static const bleach = 'assets/images/bleach.jpg';
  static const luffy = 'assets/images/luffy.jpg';
  static const mikasa = 'assets/images/mikasa.jpg';
  static const naruto = 'assets/images/naruto.jpg';
  static const natsu = 'assets/images/natsu.jpg';
  static const saitama = 'assets/images/saitama.jpg';
  static const rom = 'assets/images/rom.jpg';
  static const rom2 = 'assets/images/rom2.png';
}
