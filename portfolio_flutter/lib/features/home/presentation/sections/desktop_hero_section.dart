import 'package:flutter/material.dart';

import '../widgets/desktop_contact_button.dart';
import '../widgets/desktop_nav_item.dart';
import '../widgets/hero_action_button.dart';
import '../widgets/logo_widget.dart';
import '../widgets/placeholder_portrait.dart';
import '../widgets/right_diagonal_clipper.dart';

class DesktopHeroSection extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onContactTap;

  const DesktopHeroSection({
    super.key,
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onPortfolioTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final compactDesktop = width < 1180;

        return SizedBox(
          height: compactDesktop ? 640 : 680,
          child: Row(
            children: [
              Expanded(
                flex: compactDesktop ? 11 : 5,
                child: _HeroLeftPanel(
                  onLogoTap: onLogoTap,
                  compactDesktop: compactDesktop,
                ),
              ),
              Expanded(
                flex: compactDesktop ? 10 : 6,
                child: _HeroRightPanel(
                  onAboutTap: onAboutTap,
                  onSkillsTap: onSkillsTap,
                  onPortfolioTap: onPortfolioTap,
                  onContactTap: onContactTap,
                  compactDesktop: compactDesktop,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroLeftPanel extends StatelessWidget {
  final VoidCallback onLogoTap;
  final bool compactDesktop;

  const _HeroLeftPanel({required this.onLogoTap, required this.compactDesktop});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = compactDesktop ? 40.0 : 80.0;
    final titleSize = compactDesktop ? 46.0 : 56.0;
    final subtitleSize = compactDesktop ? 20.0 : 22.0;

    return Container(
      color: const Color(0xFFE6E6E6),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            LogoWidget(color: Colors.black, onTap: onLogoTap),
            const Spacer(),
            const Text(
              'Hi, I am',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                'Ashikur Rahman Nihal',
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 1.05,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Junior Flutter Developer /\nSoftware Support Engineer',
              style: TextStyle(
                fontSize: subtitleSize,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8A8A8A),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 36),
            const Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                HeroActionButton(
                  icon: Icons.code,
                  label: 'GitHub',
                  type: HeroActionType.github,
                ),
                HeroActionButton(
                  icon: Icons.work,
                  label: 'LinkedIn',
                  type: HeroActionType.linkedin,
                ),
                HeroActionButton(
                  icon: Icons.download_rounded,
                  label: 'Download CV',
                  type: HeroActionType.download,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _HeroRightPanel extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onContactTap;
  final bool compactDesktop;

  const _HeroRightPanel({
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onPortfolioTap,
    required this.onContactTap,
    required this.compactDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = compactDesktop ? 18.0 : 28.0;
    final topPadding = compactDesktop ? 22.0 : 28.0;
    final imageTopPadding = compactDesktop ? 124.0 : 138.0;
    final navGap = compactDesktop ? 18.0 : 28.0;

    return ClipPath(
      clipper: RightDiagonalClipper(),
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            topPadding,
            horizontalPadding,
            0,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: compactDesktop ? 18 : 22,
                      vertical: compactDesktop ? 12 : 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.14)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Center(
                            child: DesktopNavItem(
                              label: 'About me',
                              onTap: onAboutTap,
                            ),
                          ),
                        ),
                        SizedBox(width: navGap),
                        Flexible(
                          child: Center(
                            child: DesktopNavItem(
                              label: 'Skills',
                              onTap: onSkillsTap,
                            ),
                          ),
                        ),
                        SizedBox(width: navGap),
                        Flexible(
                          child: Center(
                            child: DesktopNavItem(
                              label: 'Portfolio',
                              onTap: onPortfolioTap,
                            ),
                          ),
                        ),
                        SizedBox(width: navGap),
                        DesktopContactButton(onTap: onContactTap),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: imageTopPadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset(
                    'assets/profile.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                    errorBuilder: (_, __, ___) => const PlaceholderPortrait(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
