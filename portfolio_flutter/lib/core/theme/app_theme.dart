import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_borders.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final baseTextTheme = GoogleFonts.manropeTextTheme();

    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.manrope().fontFamily,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.black,
        secondary: AppColors.charcoal,
        surface: AppColors.surface,
      ),
      textTheme: baseTextTheme.copyWith(
        headlineLarge: AppTextStyles.heroName,
        headlineMedium: AppTextStyles.sectionHeading,
        titleLarge: AppTextStyles.heroGreeting,
        titleMedium: AppTextStyles.sectionLabel,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.bodyMuted,
        labelLarge: AppTextStyles.button,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: AppBorders.thin,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          textStyle: AppTextStyles.button,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.black,
          textStyle: AppTextStyles.button,
          side: const BorderSide(
            color: AppColors.border,
            width: AppBorders.regular,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: false,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border, width: AppBorders.regular),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border, width: AppBorders.thick),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border, width: AppBorders.regular),
        ),
      ),
    );
  }
}
