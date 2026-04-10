import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle heroGreeting = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static final TextStyle heroName = GoogleFonts.manrope(
    fontSize: 64,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.05,
    letterSpacing: -1.2,
  );

  static final TextStyle heroSubtitle = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  static final TextStyle navItem = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle sectionLabel = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 6,
  );

  static final TextStyle sectionHeading = GoogleFonts.manrope(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: 1.5,
  );

  static final TextStyle body = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.7,
  );

  static final TextStyle bodyMuted = GoogleFonts.manrope(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static final TextStyle button = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 1.8,
  );
}
