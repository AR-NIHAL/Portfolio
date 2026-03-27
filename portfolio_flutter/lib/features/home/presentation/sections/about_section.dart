import 'package:flutter/material.dart';

import '../widgets/about_cards_grid.dart';
import '../widgets/about_text_block.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'About Me',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 900;
          return isSmall
              ? const Column(
                  children: [
                    AboutTextBlock(),
                    SizedBox(height: 24),
                    AboutCardsGrid(),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: AboutTextBlock()),
                    SizedBox(width: 28),
                    Expanded(flex: 2, child: AboutCardsGrid()),
                  ],
                );
        },
      ),
    );
  }
}
