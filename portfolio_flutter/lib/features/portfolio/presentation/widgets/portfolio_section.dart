import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../data/dummy/project_data.dart';
import '../../../../data/models/project_model.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  String _selectedCategory = 'ALL';

  List<ProjectModel> get _filteredProjects {
    if (_selectedCategory == 'ALL') return demoProjects;
    return demoProjects
        .where((project) => project.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          const _PortfolioHeader(),
          Container(
            width: double.infinity,
            color: AppColors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.horizontalPadding(context),
                vertical: isMobile ? 14 : 18,
              ),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: isMobile ? 18 : 28,
                  runSpacing: 10,
                  children: [
                    _FilterTab(
                      label: 'ALL',
                      isActive: _selectedCategory == 'ALL',
                      onTap: () => setState(() => _selectedCategory = 'ALL'),
                    ),
                    _FilterTab(
                      label: 'CODED',
                      isActive: _selectedCategory == 'CODED',
                      onTap: () => setState(() => _selectedCategory = 'CODED'),
                    ),
                    _FilterTab(
                      label: 'DESIGNED',
                      isActive: _selectedCategory == 'DESIGNED',
                      onTap: () => setState(() => _selectedCategory = 'DESIGNED'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SectionContainer(
            backgroundColor: AppColors.background,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.horizontalPadding(context),
              vertical: isMobile ? 28 : 42,
            ),
            child: Column(
              children: [
                _PortfolioGrid(projects: _filteredProjects),
                SizedBox(height: isMobile ? 28 : 36),
                Text(
                  'And many more to come!',
                  style: AppTextStyles.button.copyWith(
                    letterSpacing: 1.8,
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 10),
                Container(
                  width: isMobile ? 150 : 190,
                  height: 2,
                  color: AppColors.black,
                ),
                SizedBox(height: isMobile ? 8 : 10),
                Text(
                  'explore more',
                  style: AppTextStyles.bodyMuted.copyWith(
                    fontSize: isMobile ? 12 : 13,
                    letterSpacing: 0.8,
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

class _PortfolioHeader extends StatelessWidget {
  const _PortfolioHeader();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      height: isMobile ? 240 : 340,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF787878), Color(0xFF2F2F2F)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.18,
              child: CustomPaint(
                painter: _HeaderGridPainter(),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 32),
              child: const SectionTitleBox(title: 'Portfolio', darkMode: true),
            ),
          ),
        ],
      ),
    );
  }
}

class _PortfolioGrid extends StatelessWidget {
  const _PortfolioGrid({required this.projects});

  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final crossAxisCount = ResponsiveHelper.portfolioGridCount(context);
    final featured = projects.where((e) => e.isFeatured).toList();
    final normal = projects.where((e) => !e.isFeatured).toList();

    if (isMobile) {
      return Column(
        children: [
          for (final project in projects) ...[
            _ProjectCard(project: project, featured: project.isFeatured),
            const SizedBox(height: AppSpacing.lg),
          ],
        ],
      );
    }

    return Column(
      children: [
        if (featured.isNotEmpty) ...[
          _ProjectCard(project: featured.first, featured: true, height: 340),
          const SizedBox(height: AppSpacing.lg),
        ],
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: normal.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.lg,
            mainAxisSpacing: AppSpacing.lg,
            childAspectRatio: 1.02,
          ),
          itemBuilder: (context, index) {
            return _ProjectCard(project: normal[index]);
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
    this.featured = false,
    this.height,
  });

  final ProjectModel project;
  final bool featured;
  final double? height;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final double cardHeight = widget.height ?? (isMobile ? 320 : 260);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: cardHeight,
        decoration: BoxDecoration(
          color: AppColors.black,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: _hovered ? 24 : 14,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _colorForCategory(widget.project.category).withOpacity(0.95),
                      AppColors.black,
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.12,
                child: CustomPaint(painter: _ProjectTexturePainter()),
              ),
            ),
            Positioned(
              top: 18,
              right: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white.withOpacity(0.75)),
                  color: Colors.transparent,
                ),
                child: Text(
                  widget.project.category,
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                    letterSpacing: 1.6,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 18,
              child: Container(
                padding: EdgeInsets.all(widget.featured ? 20 : 16),
                color: AppColors.black.withOpacity(widget.featured ? 0.55 : 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppTextStyles.sectionHeading.copyWith(
                        color: AppColors.white,
                        fontSize: widget.featured ? (isMobile ? 22 : 28) : 20,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.subtitle,
                      maxLines: widget.featured ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.white.withOpacity(0.92),
                        fontSize: 13.5,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _ProjectAction(label: 'DEMO'),
                        const SizedBox(width: AppSpacing.md),
                        _ProjectAction(label: 'MORE'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _colorForCategory(String category) {
    switch (category) {
      case 'DESIGNED':
        return const Color(0xFF5E5E5E);
      case 'CODED':
        return const Color(0xFF2E2E2E);
      default:
        return const Color(0xFF4A4A4A);
    }
  }
}

class _ProjectAction extends StatefulWidget {
  const _ProjectAction({required this.label});

  final String label;

  @override
  State<_ProjectAction> createState() => _ProjectActionState();
}

class _ProjectActionState extends State<_ProjectAction> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.white : Colors.transparent,
          border: Border.all(color: AppColors.white.withOpacity(0.85)),
        ),
        child: Text(
          widget.label,
          style: AppTextStyles.button.copyWith(
            color: _hovered ? AppColors.black : AppColors.white,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

class _FilterTab extends StatefulWidget {
  const _FilterTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<_FilterTab> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 160),
          style: AppTextStyles.button.copyWith(
            color: active || _hovered ? AppColors.white : AppColors.white.withOpacity(0.7),
            fontSize: active ? 12.5 : 12,
            letterSpacing: 2.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.label),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: active ? 38 : 20,
                height: 2,
                color: active || _hovered ? AppColors.white : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..strokeWidth = 1;

    const step = 30.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ProjectTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..strokeWidth = 1;

    for (double i = -size.height; i < size.width; i += 28) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
