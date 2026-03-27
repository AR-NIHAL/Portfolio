import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/desktop_hero_section.dart';
import '../sections/intro_banner_section.dart';
import '../sections/mobile_hero_section.dart';
import '../sections/portfolio_section.dart';
import '../sections/skills_section.dart';
import '../widgets/footer_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                isMobile
                    ? MobileHeroSection(
                        onLogoTap: _scrollToTop,
                        onAboutTap: () => _scrollToSection(_aboutKey),
                        onSkillsTap: () => _scrollToSection(_skillsKey),
                        onPortfolioTap: () => _scrollToSection(_portfolioKey),
                        onContactTap: () => _scrollToSection(_contactKey),
                      )
                    : DesktopHeroSection(
                        onLogoTap: _scrollToTop,
                        onAboutTap: () => _scrollToSection(_aboutKey),
                        onSkillsTap: () => _scrollToSection(_skillsKey),
                        onPortfolioTap: () => _scrollToSection(_portfolioKey),
                        onContactTap: () => _scrollToSection(_contactKey),
                      ),
                const IntroBannerSection(),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                PortfolioSection(key: _portfolioKey),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
