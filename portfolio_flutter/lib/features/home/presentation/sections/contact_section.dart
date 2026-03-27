import 'package:flutter/material.dart';

import '../widgets/contact_chip.dart';
import '../widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: Colors.white,
      title: 'Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'I am open to Flutter Developer, Software Support, and Implementation-related opportunities.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ContactChip(title: 'Email', value: 'arnihal.cs@gmail.com'),
              ContactChip(title: 'GitHub', value: 'github.com/yourusername'),
              ContactChip(title: 'LinkedIn', value: 'linkedin.com/in/yourusername'),
            ],
          ),
        ],
      ),
    );
  }
}
