import 'package:flutter/material.dart';

import '../../../home/domain/portfolio_section_type.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/responsive/responsive_helper.dart';

class PortfolioNavbar extends StatelessWidget {
  final PortfolioSectionType activeSection;
  final ValueChanged<PortfolioSectionType> onSectionSelected;
  final VoidCallback onMenuPressed;
  final double height;
  final bool elevated;

  const PortfolioNavbar({
    super.key,
    required this.activeSection,
    required this.onSectionSelected,
    required this.onMenuPressed,
    required this.height,
    this.elevated = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: elevated ? AppColors.black.withOpacity(0.92) : AppColors.black,
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.20),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
              child: isMobile
                  ? _MobileNavbar(onMenuPressed: onMenuPressed, height: height)
                  : _DesktopNavbar(
                      activeSection: activeSection,
                      onSectionSelected: onSectionSelected,
                      height: height,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final double height;

  const _MobileNavbar({required this.onMenuPressed, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          const Text(
            'NG',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuPressed,
            splashRadius: 22,
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopNavbar extends StatelessWidget {
  final PortfolioSectionType activeSection;
  final ValueChanged<PortfolioSectionType> onSectionSelected;
  final double height;

  const _DesktopNavbar({
    required this.activeSection,
    required this.onSectionSelected,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_NavItemData>[
      const _NavItemData('About me', PortfolioSectionType.about),
      const _NavItemData('Skills', PortfolioSectionType.skills),
      const _NavItemData('Experience', PortfolioSectionType.experience),
      const _NavItemData('Portfolio', PortfolioSectionType.portfolio),
    ];

    return SizedBox(
      height: height,
      child: Row(
        children: [
          const Text(
            'NG',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
            ),
          ),
          const Spacer(),
          ...items.map((item) {
            final isActive = activeSection == item.section;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _DesktopNavItem(
                label: item.label,
                isActive: isActive,
                onTap: () => onSectionSelected(item.section),
              ),
            );
          }),
          const SizedBox(width: 18),
          InkWell(
            onTap: () => onSectionSelected(PortfolioSectionType.contact),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'CONTACT ME',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopNavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DesktopNavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_DesktopNavItem> createState() => _DesktopNavItemState();
}

class _DesktopNavItemState extends State<_DesktopNavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.isActive || _hovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: TextStyle(
                  color: isHighlighted ? AppColors.white : Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
                child: Text(widget.label),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                width: widget.isActive ? 28 : (_hovered ? 18 : 0),
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String label;
  final PortfolioSectionType section;

  const _NavItemData(this.label, this.section);
}
