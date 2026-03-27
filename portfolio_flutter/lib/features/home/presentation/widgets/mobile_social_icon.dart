import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/portfolio_links.dart';
import 'hero_action_button.dart';

class MobileSocialIcon extends StatelessWidget {
  final IconData icon;
  final HeroActionType type;

  const MobileSocialIcon({
    super.key,
    required this.icon,
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
    return InkWell(
      onTap: _handleTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
