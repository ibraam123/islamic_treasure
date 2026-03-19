import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {

  // Heading 1
  static const TextStyle h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  // Heading 2
  static const TextStyle h2 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.3,
  );

  // Subheading
  static const TextStyle subheading = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  // Body Text
  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    height: 1.5,
  );

  // Caption / Small
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );


}