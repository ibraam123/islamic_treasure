import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        secondary: AppColors.primaryBlue,
        surface: AppColors.background,
      ),
      textTheme: GoogleFonts.cairoTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.cairo(
          color: AppColors.darkGreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: AppColors.darkGreen),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.navBarUnselected,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),
    );
  }
}
