import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<_SkillData> _usingNowSkills = [
    _SkillData(label: 'DART', svgPath: 'assets/icons/icons8-dart.svg'),
    _SkillData(label: 'KOTLIN', svgPath: 'assets/icons/icons8-kotlin.svg'),
    _SkillData(label: 'FLUTTER', svgPath: 'assets/icons/icons8-flutter.svg'),
    _SkillData(label: 'PYTHON', svgPath: 'assets/icons/icons8-python.svg'),
    _SkillData(label: 'GIT', svgPath: 'assets/icons/icons8-git.svg'),
    _SkillData(label: 'LINUX', svgPath: 'assets/icons/linux-svgrepo-com.svg'),
    _SkillData(label: 'VS CODE', svgPath: 'assets/icons/icons8-visual-studio-code.svg'),
    _SkillData(label: 'ANDROID\nSTUDIO', svgPath: 'assets/icons/icons8-android-studio.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final topPadding = isMobile ? 56.0 : 48.0;
    final bottomPadding = isMobile ? 72.0 : 110.0;

    final horizontalPadding = ResponsiveHelper.horizontalPadding(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        bottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: SectionTitleBox(title: 'Skills')),
          SizedBox(height: isMobile ? 56 : 56),
          _SkillGroup(title: 'USING NOW:', skills: _usingNowSkills),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.title, required this.skills});

  final String title;
  final List<_SkillData> skills;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.sectionLabel.copyWith(
            fontSize: isMobile ? 18 : 22,
            letterSpacing: isMobile ? 3 : 5,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: isMobile ? 28 : 40),
        Wrap(
          spacing: isMobile ? 16 : 28,
          runSpacing: isMobile ? 28 : 40,
          children: skills
              .map((skill) => _SkillItem(skill: skill))
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.skill});

  final _SkillData skill;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final width = isMobile ? 96.0 : 118.0;
    final containerSize = isMobile ? 72.0 : 96.0;
    final svgSize = isMobile ? 32.0 : 44.0;

    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              skill.svgPath,
              width: svgSize,
              height: svgSize,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: isMobile ? 12 : AppSpacing.md),
          Text(
            skill.label,
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              fontSize: isMobile ? 10.5 : 12,
              letterSpacing: isMobile ? 1.5 : 2.1,
              height: 1.35,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillData {
  const _SkillData({
    required this.label,
    required this.svgPath,
  });

  final String label;
  final String svgPath;
}
