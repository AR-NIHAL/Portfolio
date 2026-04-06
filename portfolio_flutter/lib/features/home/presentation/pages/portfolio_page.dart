import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../about/presentation/widgets/about_section.dart';
import '../../../contact/presentation/widgets/contact_section.dart';
import '../../../experience/presentation/widgets/experience_section.dart';
import '../../../footer/presentation/widgets/footer_section.dart';
import '../../../hero/presentation/widgets/hero_section.dart';
import '../../../home/domain/portfolio_section_type.dart';
import '../../../intro/presentation/widgets/intro_strip_section.dart';
import '../../../navbar/presentation/widgets/mobile_nav_drawer.dart';
import '../../../navbar/presentation/widgets/portfolio_navbar.dart';
import '../../../portfolio/presentation/widgets/portfolio_section.dart';
import '../../../skills/presentation/widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  static const double _navbarHeight = 88;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  PortfolioSectionType _activeSection = PortfolioSectionType.about;
  bool _mobileMenuOpen = false;
  bool _navbarElevated = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleScroll();
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    final elevated = _scrollController.offset > 8;
    if (elevated != _navbarElevated) {
      setState(() {
        _navbarElevated = elevated;
      });
    }

    final section = _detectActiveSection();
    if (section != _activeSection) {
      setState(() {
        _activeSection = section;
      });
    }
  }

  PortfolioSectionType _detectActiveSection() {
    final offsets = <PortfolioSectionType, double>{
      PortfolioSectionType.hero: _getWidgetOffset(_heroKey),
      PortfolioSectionType.about: _getWidgetOffset(_aboutKey),
      PortfolioSectionType.skills: _getWidgetOffset(_skillsKey),
      PortfolioSectionType.experience: _getWidgetOffset(_experienceKey),
      PortfolioSectionType.portfolio: _getWidgetOffset(_portfolioKey),
      PortfolioSectionType.contact: _getWidgetOffset(_contactKey),
    };

    const triggerOffset = _navbarHeight + 120;

    PortfolioSectionType current = PortfolioSectionType.about;

    for (final entry in offsets.entries) {
      if (entry.value <= triggerOffset) {
        current = entry.key;
      }
    }

    return current;
  }

  double _getWidgetOffset(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return double.infinity;

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return double.infinity;

    final offset = renderObject.localToGlobal(Offset.zero);
    return offset.dy;
  }

  void _toggleMobileMenu() {
    setState(() {
      _mobileMenuOpen = !_mobileMenuOpen;
    });
  }

  void _closeMobileMenu() {
    if (_mobileMenuOpen) {
      setState(() {
        _mobileMenuOpen = false;
      });
    }
  }

  void _scrollToSection(PortfolioSectionType section) {
    _closeMobileMenu();

    switch (section) {
      case PortfolioSectionType.hero:
        _scrollToKey(_heroKey);
        break;
      case PortfolioSectionType.about:
        _scrollToKey(_aboutKey);
        break;
      case PortfolioSectionType.skills:
        _scrollToKey(_skillsKey);
        break;
      case PortfolioSectionType.experience:
        _scrollToKey(_experienceKey);
        break;
      case PortfolioSectionType.portfolio:
        _scrollToKey(_portfolioKey);
        break;
      case PortfolioSectionType.contact:
        _scrollToKey(_contactKey);
        break;
    }
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: _navbarHeight),
                KeyedSubtree(key: _heroKey, child: const HeroSection()),
                const IntroStripSection(),
                KeyedSubtree(key: _aboutKey, child: const AboutSection()),
                KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
                KeyedSubtree(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
                KeyedSubtree(
                  key: _portfolioKey,
                  child: const PortfolioSection(),
                ),
                KeyedSubtree(key: _contactKey, child: const ContactSection()),
                FooterSection(
                  onBackToTop: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 550),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavbar(
              activeSection: _activeSection,
              onSectionSelected: _scrollToSection,
              onMenuPressed: _toggleMobileMenu,
              elevated: _navbarElevated,
              height: _navbarHeight,
            ),
          ),
          if (isMobile && _mobileMenuOpen)
            Positioned(
              top: _navbarHeight,
              left: 0,
              right: 0,
              child: MobileNavDrawer(
                activeSection: _activeSection,
                onSectionSelected: _scrollToSection,
                onClose: _closeMobileMenu,
              ),
            ),
        ],
      ),
    );
  }
}
