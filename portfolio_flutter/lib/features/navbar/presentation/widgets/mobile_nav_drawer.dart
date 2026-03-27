import 'package:flutter/material.dart';

import '../../../home/domain/portfolio_section_type.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class MobileNavDrawer extends StatelessWidget {
  final PortfolioSectionType activeSection;
  final ValueChanged<PortfolioSectionType> onSectionSelected;
  final VoidCallback onClose;

  const MobileNavDrawer({
    super.key,
    required this.activeSection,
    required this.onSectionSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_NavDrawerItemData>[
      const _NavDrawerItemData('About me', PortfolioSectionType.about),
      const _NavDrawerItemData('Skills', PortfolioSectionType.skills),
      const _NavDrawerItemData('Experience', PortfolioSectionType.experience),
      const _NavDrawerItemData('Portfolio', PortfolioSectionType.portfolio),
      const _NavDrawerItemData('Contact me', PortfolioSectionType.contact),
    ];

    return Material(
      color: AppColors.black,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            ...items.map((item) {
              final isActive = activeSection == item.section;

              if (item.section == PortfolioSectionType.contact) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InkWell(
                    onTap: () {
                      onSectionSelected(item.section);
                      onClose();
                    },
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: Text(
                        item.label.toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: InkWell(
                  onTap: () {
                    onSectionSelected(item.section);
                    onClose();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: isActive ? AppColors.white : Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _NavDrawerItemData {
  final String label;
  final PortfolioSectionType section;

  const _NavDrawerItemData(this.label, this.section);
}
