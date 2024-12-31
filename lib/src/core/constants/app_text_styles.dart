import 'package:assignment/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class AppTextStyles {
  // to calculate the height of the text use this ratio font height in design (figma) divided by font size

  // we add font family and size and color with percentage and type then font height
  static TextStyle defaultFontDSizeBlack100Bold1 = const TextStyle(
    fontWeight: FontWeightHelper.bold,
    color: AppColors.black,
  );
  static TextStyle defaultFont22Black100Bold1 = const TextStyle(
    fontWeight: FontWeightHelper.bold,
    color: AppColors.black,
  );
  static TextStyle defaultFont16Black100regular1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );
  static TextStyle defaultFont16Green100regular1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.green,
  );
  static TextStyle defaultFon20Green100regular1 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.green,
  );
}

class AppColor {}
