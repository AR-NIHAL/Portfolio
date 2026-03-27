import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/models/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  final bool compact;

  const ExperienceCard({
    super.key,
    required this.experience,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 20 : 28),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(
          color: AppColors.border.withOpacity(0.7),
          width: 1.4,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.role.toUpperCase(),
            style: AppTextStyles.sectionHeading.copyWith(
              fontSize: compact ? 18 : 22,
              letterSpacing: 2.2,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            experience.companyName,
            style: AppTextStyles.body.copyWith(
              fontSize: compact ? 16 : 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${experience.duration} • ${experience.location}',
            style: AppTextStyles.body.copyWith(
              fontSize: compact ? 12 : 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            experience.description,
            style: AppTextStyles.body.copyWith(
              height: 1.7,
              fontSize: compact ? 13 : 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: experience.technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border.withOpacity(0.6)),
                ),
                child: Text(
                  tech.toUpperCase(),
                  style: AppTextStyles.body.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    color: AppColors.textPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
