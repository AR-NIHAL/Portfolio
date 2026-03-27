import 'package:flutter/material.dart';

import '../widgets/section_wrapper.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: Colors.white,
      title: 'Skills',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: const [
          SkillCard(
            title: 'Flutter Development',
            skills: [
              'Flutter',
              'Dart',
              'Responsive UI',
              'State Management',
              'Form Handling',
              'Clean Structure',
            ],
          ),
          SkillCard(
            title: 'Backend & Web',
            skills: [
              'Laravel',
              'PHP',
              'MySQL',
              'REST API Basics',
              'JSON',
              'MVC Concept',
            ],
          ),
          SkillCard(
            title: 'Support & Deployment',
            skills: [
              'Software Troubleshooting',
              'Laravel Installation',
              'Server Setup Basics',
              'Bug Investigation',
              'Implementation Support',
              'Deployment Basics',
            ],
          ),
        ],
      ),
    );
  }
}
