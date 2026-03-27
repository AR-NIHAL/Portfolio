import 'package:flutter/material.dart';

import '../../core/constants/app_borders.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_helper.dart';

class SectionTitleBox extends StatelessWidget {
  const SectionTitleBox({
    super.key,
    required this.title,
    this.darkMode = false,
  });

  final String title;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final textColor = darkMode ? AppColors.white : AppColors.textPrimary;
    final borderColor = darkMode ? AppColors.white : AppColors.border;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 26 : 44,
        vertical: isMobile ? 16 : 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: AppBorders.regular,
        ),
      ),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppTextStyles.sectionLabel.copyWith(
          color: textColor,
          fontSize: isMobile ? 18 : 22,
          letterSpacing: isMobile ? 4.5 : 7,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
