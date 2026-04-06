import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/social_icon_button.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.onBackToTop,
  });

  static const String _githubUrl = 'https://github.com/AR-NIHAL';
  static const String _linkedinUrl = 'https://www.linkedin.com/in/arnihal/';
  static const String _emailAddress = 'arnihal.cs@gmail.com';

  final VoidCallback onBackToTop;

  Future<void> _openExternalLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: _emailAddress,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.black,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.horizontalPadding(context),
        vertical: isMobile ? 36 : 46,
      ),
        child: Column(
          children: [
          _BackToTopButton(onTap: onBackToTop),
          SizedBox(height: isMobile ? 22 : 26),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              SocialIconButton(
                icon: Icons.code_rounded,
                onDark: true,
                onTap: () => _openExternalLink(_githubUrl),
              ),
              SocialIconButton(
                icon: Icons.work_outline_rounded,
                onDark: true,
                onTap: () => _openExternalLink(_linkedinUrl),
              ),
              SocialIconButton(
                icon: Icons.alternate_email_rounded,
                onDark: true,
                onTap: _sendEmail,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 20 : 24),
          Text(
            '© 2026 Nihal. All rights reserved.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMuted.copyWith(
              color: AppColors.white.withOpacity(0.72),
              fontSize: isMobile ? 12 : 13,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  const _BackToTopButton({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'BACK TO TOP',
              style: AppTextStyles.button.copyWith(
                color: AppColors.white,
                fontSize: 11,
                letterSpacing: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
