import 'package:flutter/material.dart';

import '../widgets/hero_action_button.dart';
import '../widgets/logo_widget.dart';
import '../widgets/mobile_social_icon.dart';
import '../widgets/placeholder_portrait.dart';

class MobileHeroSection extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onContactTap;

  const MobileHeroSection({
    super.key,
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onPortfolioTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
      child: Column(
        children: [
          _MobileTopBar(
            onLogoTap: onLogoTap,
            onAboutTap: onAboutTap,
            onSkillsTap: onSkillsTap,
            onPortfolioTap: onPortfolioTap,
            onContactTap: onContactTap,
          ),
          const SizedBox(height: 18),
          const _MobileHeroCard(),
        ],
      ),
    );
  }
}

class _MobileTopBar extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onContactTap;

  const _MobileTopBar({
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onPortfolioTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogoWidget(color: Colors.white, onTap: onLogoTap),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          color: Colors.white,
          onSelected: (value) {
            if (value == 'about') onAboutTap();
            if (value == 'skills') onSkillsTap();
            if (value == 'portfolio') onPortfolioTap();
            if (value == 'contact') onContactTap();
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'about', child: Text('About me')),
            PopupMenuItem(value: 'skills', child: Text('Skills')),
            PopupMenuItem(value: 'portfolio', child: Text('Portfolio')),
            PopupMenuItem(value: 'contact', child: Text('Contact')),
          ],
        ),
      ],
    );
  }
}

class _MobileHeroCard extends StatelessWidget {
  const _MobileHeroCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/profile.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const PlaceholderPortrait(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.82),
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, I am',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ashikur Rahman Nihal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Flutter Developer / Support Engineer',
                          style: TextStyle(
                            color: Color(0xFFD0D0D0),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      MobileSocialIcon(
                        icon: Icons.code,
                        type: HeroActionType.github,
                      ),
                      SizedBox(height: 10),
                      MobileSocialIcon(
                        icon: Icons.work,
                        type: HeroActionType.linkedin,
                      ),
                      SizedBox(height: 10),
                      MobileSocialIcon(
                        icon: Icons.download_rounded,
                        type: HeroActionType.download,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
