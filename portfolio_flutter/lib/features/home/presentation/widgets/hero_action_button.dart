import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/portfolio_links.dart';

enum HeroActionType { github, linkedin, download }

class HeroActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final HeroActionType type;

  const HeroActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.type,
  });

  Future<void> _handleTap() async {
    Uri uri;

    switch (type) {
      case HeroActionType.github:
        uri = Uri.parse(PortfolioLinks.github);
        break;
      case HeroActionType.linkedin:
        uri = Uri.parse(PortfolioLinks.linkedin);
        break;
      case HeroActionType.download:
        uri = Uri.parse(PortfolioLinks.cv);
        break;
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: const BoxConstraints(minWidth: 52),
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.black, size: 24),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
