import 'package:flutter/material.dart';

class AppTextStyle {
  ///White
  static const black = TextStyle(color: Colors.black);
  static const white = TextStyle(color: Colors.white);

  //s6
  static final blackS6 = black.copyWith(fontSize: 6);
  static final blackS6Bold = blackS6.copyWith(fontWeight: FontWeight.bold);

  static final blackS6Medium = blackS6.copyWith(fontWeight: FontWeight.w500);
  static final blackS6MediumGrba =
      blackS6.copyWith(color: Color.fromRGBO(255, 255, 255, 0.5));
  //s9
  static final whiteS8 = white.copyWith(fontSize: 8);
  static final whiteS8Medium = whiteS8.copyWith(fontWeight: FontWeight.w500);
  static final whiteS8MediumGrba =
      whiteS8.copyWith(color: Color.fromRGBO(255, 255, 255, 0.5));
  //s9
  static final whiteS9 = white.copyWith(fontSize: 9);
  static final whiteS9Bold = whiteS9.copyWith(fontWeight: FontWeight.bold);
  static final whiteS9W800 = whiteS9.copyWith(fontWeight: FontWeight.w800);
  //s12
  static final whiteS12 = white.copyWith(fontSize: 12);
  static final whiteS12Medium = whiteS12.copyWith(fontWeight: FontWeight.w500);
  static final whiteS12Bold = whiteS12.copyWith(fontWeight: FontWeight.bold);
  static final whiteS12W800 = whiteS12.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS18W800 = whiteS18.copyWith(fontWeight: FontWeight.w800);
  static final whiteS18MediumGrba =
      whiteS18.copyWith(color: Color.fromRGBO(255, 255, 255, 0.5));

  //s64
  static final whiteS64 = white.copyWith(fontSize: 64);
  static final whiteS64Bold = whiteS64.copyWith(fontWeight: FontWeight.bold);
  static final whiteS64W800 = whiteS64.copyWith(fontWeight: FontWeight.w800);
}
