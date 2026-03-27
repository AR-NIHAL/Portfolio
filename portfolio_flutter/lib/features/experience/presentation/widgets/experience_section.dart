import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../data/dummy/experience_data.dart';
import '../../../../shared/widgets/decorative_divider.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: SectionContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.xxl),
            const Center(child: SectionTitleBox(title: 'EXPERIENCE')),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'A summary of the professional roles and practical work I have done so far, including support engineering, troubleshooting, testing, and Flutter development practice.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    height: 1.8,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Center(child: DecorativeDivider()),
            const SizedBox(height: AppSpacing.xxl),

            if (isMobile)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: experienceData.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: SizedBox(
                      width: double.infinity,
                      child: ExperienceCard(experience: item, compact: true),
                    ),
                  );
                }).toList(),
              )
            else if (isTablet)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: experienceData.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                    child: SizedBox(
                      width: double.infinity,
                      child: ExperienceCard(experience: item),
                    ),
                  );
                }).toList(),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(experienceData.length, (index) {
                  final item = experienceData[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == experienceData.length - 1
                          ? 0
                          : AppSpacing.xl,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ExperienceCard(experience: item),
                    ),
                  );
                }),
              ),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
