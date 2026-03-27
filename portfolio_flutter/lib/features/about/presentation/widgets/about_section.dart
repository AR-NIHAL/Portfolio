import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/decorative_divider.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final horizontalGap = isMobile ? AppSpacing.lg : AppSpacing.xxl;
    final verticalGap = isMobile ? AppSpacing.xl : 40.0;

    return SectionContainer(
      backgroundColor: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.horizontalPadding(context),
        vertical: ResponsiveHelper.sectionSpacing(context),
      ),
      child: Column(
        children: [
          const SectionTitleBox(title: 'About Me'),
          SizedBox(height: isMobile ? 28 : 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780),
            child: Text(
              'I am Ashikur Rahman Nihal, a Software Support Engineer with hands-on experience supporting SaaS and web applications in production. My work focuses on issue investigation, root cause analysis, bug reproduction, API troubleshooting, and helping users solve technical problems clearly and efficiently. Over time, this experience has shaped how I think about software. I do not only see software as code — I see it as a product that must be reliable, understandable, and useful for real people. Alongside my support career, I am strengthening my skills in Flutter development, testing, and product quality so I can grow into broader software engineering roles in the future.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: isMobile ? 14 : 15,
                height: 1.95,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 22 : 28),
          const _ExploreAction(),
          SizedBox(height: isMobile ? 28 : 36),
          const DecorativeDivider(),
          SizedBox(height: isMobile ? 42 : 64),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile || constraints.maxWidth < 760) {
                return Column(
                  children: const [
                    _CapabilityCard(
                      title: 'Design',
                      description:
                          'I care deeply about alignment, spacing, typography, and visual hierarchy so the final interface feels intentional rather than randomly assembled.',
                      icon: Icons.draw_outlined,
                    ),
                    SizedBox(height: AppSpacing.xl),
                    _CapabilityCard(
                      title: 'Development',
                      description:
                          'I build responsive Flutter interfaces with reusable widgets, clear structure, and clean logic so each section can scale without becoming messy.',
                      icon: Icons.code_rounded,
                    ),
                    SizedBox(height: AppSpacing.xl),
                    _CapabilityCard(
                      title: 'Maintenance',
                      description:
                          'I value readable code, modular files, and practical improvements that make future updates easier for both me and any team I work with.',
                      icon: Icons.settings_backup_restore_rounded,
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: _CapabilityCard(
                          title: 'Design',
                          description:
                              'I care deeply about alignment, spacing, typography, and visual hierarchy so the final interface feels intentional rather than randomly assembled.',
                          icon: Icons.draw_outlined,
                        ),
                      ),
                      SizedBox(width: AppSpacing.xxl),
                      Expanded(
                        child: _CapabilityCard(
                          title: 'Development',
                          description:
                              'I build responsive Flutter interfaces with reusable widgets, clear structure, and clean logic so each section can scale without becoming messy.',
                          icon: Icons.code_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: verticalGap),
                  Row(
                    children: const [
                      Spacer(),
                      Expanded(
                        child: _CapabilityCard(
                          title: 'Maintenance',
                          description:
                              'I value readable code, modular files, and practical improvements that make future updates easier for both me and any team I work with.',
                          icon: Icons.settings_backup_restore_rounded,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: horizontalGap),
        ],
      ),
    );
  }
}

class _ExploreAction extends StatelessWidget {
  const _ExploreAction();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 2, color: AppColors.textPrimary),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'EXPLORE',
              style: AppTextStyles.button.copyWith(letterSpacing: 2.2),
            ),
          ),
          Container(width: 2, color: AppColors.textPrimary),
        ],
      ),
    );
  }
}

class _CapabilityCard extends StatelessWidget {
  const _CapabilityCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 220),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 6,
        vertical: isMobile ? 6 : 4,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              icon,
              size: isMobile ? 62 : 76,
              color: AppColors.textPrimary.withOpacity(0.07),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 18 : 26,
              left: isMobile ? 6 : 12,
              right: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: AppTextStyles.sectionHeading.copyWith(
                    fontSize: isMobile ? 20 : 24,
                    letterSpacing: 2.4,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  description,
                  style: AppTextStyles.bodyMuted.copyWith(
                    fontSize: isMobile ? 14 : 15,
                    color: AppColors.textPrimary,
                    height: 1.85,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
