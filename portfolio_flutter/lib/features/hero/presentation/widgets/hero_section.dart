import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const String _githubUrl = 'https://github.com/AR-NIHAL';
  static const String _linkedinUrl = 'https://www.linkedin.com/in/arnihal/';
  static const String _cvAssetPath = 'assets/files/Ashikur_Rahman_Nihal_CV.pdf';

  Future<void> _openExternalLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void _downloadCv() {
    final anchor = html.AnchorElement(href: _cvAssetPath)
      ..setAttribute('download', 'Ashikur_Rahman_Nihal_CV.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final height = ResponsiveHelper.heroHeight(context);

    return Container(
      width: double.infinity,
      height: height,
      color: AppColors.background,
      child: isMobile
          ? _MobileHeroSection(
              onGithubTap: () => _openExternalLink(_githubUrl),
              onLinkedinTap: () => _openExternalLink(_linkedinUrl),
              onDownloadCvTap: _downloadCv,
            )
          : _DesktopHeroSection(
              onGithubTap: () => _openExternalLink(_githubUrl),
              onLinkedinTap: () => _openExternalLink(_linkedinUrl),
              onDownloadCvTap: _downloadCv,
            ),
    );
  }
}

class _DesktopHeroSection extends StatelessWidget {
  const _DesktopHeroSection({
    required this.onGithubTap,
    required this.onLinkedinTap,
    required this.onDownloadCvTap,
  });

  final VoidCallback onGithubTap;
  final VoidCallback onLinkedinTap;
  final VoidCallback onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: double.infinity,
            color: AppColors.background,
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppSpacing.xxl,
                    right: AppSpacing.xl,
                    top: AppSpacing.xxl,
                    bottom: AppSpacing.xxl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hi, I am', style: AppTextStyles.heroGreeting),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'Ashikur Rahman Nihal',
                        style: AppTextStyles.heroName,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        width: 560,
                        child: Text(
                          'Mobile Application Developer / Software Support Engineer',
                          style: AppTextStyles.heroSubtitle,
                        ),
                      ),
                      const SizedBox(height: 34),
                      SizedBox(
                        width: 360,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                _HeroActionButton(
                                  label: 'GITHUB',
                                  onTap: onGithubTap,
                                  width: 172,
                                ),
                                _HeroActionButton(
                                  label: 'LINKEDIN',
                                  onTap: onLinkedinTap,
                                  width: 172,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _HeroActionButton(
                              label: 'DOWNLOAD CV',
                              onTap: onDownloadCvTap,
                              width: 180,
                              isPrimary: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ClipPath(
            clipper: _RightPanelClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.black,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white10),
                    ),
                  ),
                  const Icon(Icons.person, size: 240, color: Colors.white24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileHeroSection extends StatelessWidget {
  const _MobileHeroSection({
    required this.onGithubTap,
    required this.onLinkedinTap,
    required this.onDownloadCvTap,
  });

  final VoidCallback onGithubTap;
  final VoidCallback onLinkedinTap;
  final VoidCallback onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.black,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/profile.jpg',
              width: 180,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: _BottomOverlayClipper(),
            child: Container(
              width: double.infinity,
              height: 320,
              color: const Color(0xCC101010),
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Hi, I am',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nihal Ahmed',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mobile Application Developer / Software Support Engineer',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _HeroActionButton(
                        label: 'GITHUB',
                        onTap: onGithubTap,
                        onDark: true,
                        compact: true,
                      ),
                      _HeroActionButton(
                        label: 'LINKEDIN',
                        onTap: onLinkedinTap,
                        onDark: true,
                        compact: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _HeroActionButton(
                    label: 'DOWNLOAD CV',
                    onTap: onDownloadCvTap,
                    onDark: true,
                    compact: true,
                    width: 170,
                    isPrimary: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroActionButton extends StatefulWidget {
  const _HeroActionButton({
    required this.label,
    required this.onTap,
    this.onDark = false,
    this.compact = false,
    this.width,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool onDark;
  final bool compact;
  final double? width;
  final bool isPrimary;

  @override
  State<_HeroActionButton> createState() => _HeroActionButtonState();
}

class _HeroActionButtonState extends State<_HeroActionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.onDark ? AppColors.white : AppColors.black;
    final baseBackground = widget.isPrimary
        ? (widget.onDark ? AppColors.white : AppColors.black)
        : Colors.transparent;
    final textColor = widget.isPrimary
        ? (widget.onDark ? AppColors.black : AppColors.white)
        : (widget.onDark ? AppColors.white : AppColors.black);
    final hoverBackground = widget.isPrimary
        ? (widget.onDark ? const Color(0xFFEDEDED) : const Color(0xFF181818))
        : (widget.onDark
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.05));
    final shadowColor = widget.onDark
        ? Colors.black.withOpacity(0.12)
        : Colors.black.withOpacity(0.08);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: widget.width,
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 18 : 22,
            vertical: widget.compact ? 11 : 14,
          ),
          decoration: BoxDecoration(
            color: _hovered ? hoverBackground : baseBackground,
            border: Border.all(color: borderColor, width: 1.3),
            borderRadius: BorderRadius.circular(widget.compact ? 12 : 14),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              color: textColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              fontSize: widget.compact ? 11 : 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _RightPanelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.22, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _BottomOverlayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.34);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
