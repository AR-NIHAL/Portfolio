import 'package:flutter/material.dart';

import '../../core/constants/app_borders.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import 'section_container.dart';

class PlaceholderBlock extends StatelessWidget {
  const PlaceholderBlock({
    super.key,
    required this.title,
    required this.height,
    this.dark = false,
  });

  final String title;
  final double height;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final foreground = dark ? AppColors.white : AppColors.textPrimary;
    final background = dark ? AppColors.charcoal : Colors.transparent;

    return SectionContainer(
      backgroundColor: background,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: dark ? AppColors.white : AppColors.border,
            width: AppBorders.thin,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: AppTextStyles.sectionLabel.copyWith(color: foreground),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Placeholder section for the upcoming UI prompt.',
                style: AppTextStyles.bodyMuted.copyWith(
                  color: foreground.withOpacity(0.75),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
