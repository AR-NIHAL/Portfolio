import 'package:flutter/material.dart';

import 'info_card.dart';

class AboutCardsGrid extends StatelessWidget {
  const AboutCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: const [
        InfoCard(title: 'Location', value: 'Bangladesh'),
        InfoCard(title: 'Current Role', value: 'Software Support Engineer'),
        InfoCard(title: 'Main Focus', value: 'Flutter Development'),
        InfoCard(title: 'Learning', value: 'Deployment & DevOps Basics'),
      ],
    );
  }
}
