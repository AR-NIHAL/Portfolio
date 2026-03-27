import 'package:flutter/material.dart';

import '../widgets/project_card.dart';
import '../widgets/section_wrapper.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Portfolio',
      child: Column(
        children: const [
          ProjectCard(
            title: 'Expense Tracker App',
            description:
                'A Flutter-based expense tracker with dashboard, transaction flow, budget overview, and analytics section.',
            tech: 'Flutter • Dart • Riverpod • Hive/SQLite',
          ),
          SizedBox(height: 18),
          ProjectCard(
            title: 'Task Manager App',
            description:
                'A productivity app focused on task creation, filtering, and clean mobile-first workflow design.',
            tech: 'Flutter • Dart • Local Storage',
          ),
          SizedBox(height: 18),
          ProjectCard(
            title: 'Support & Deployment Work',
            description:
                'Practical work involving Laravel installation, troubleshooting software issues, environment setup, and deployment assistance.',
            tech: 'Laravel • PHP • MySQL • Server Setup',
          ),
        ],
      ),
    );
  }
}
