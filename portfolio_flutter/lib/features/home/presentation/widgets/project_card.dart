import 'package:flutter/material.dart';

import 'action_chip_widget.dart';
import 'project_preview_box.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String tech;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 700;
          return isSmall
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProjectPreviewBox(),
                    const SizedBox(height: 18),
                    _ProjectTextContent(
                      title: title,
                      description: description,
                      tech: tech,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const SizedBox(
                      width: 260,
                      height: 180,
                      child: ProjectPreviewBox(),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: _ProjectTextContent(
                        title: title,
                        description: description,
                        tech: tech,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class _ProjectTextContent extends StatelessWidget {
  final String title;
  final String description;
  final String tech;

  const _ProjectTextContent({
    required this.title,
    required this.description,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          tech,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 18),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ActionChipWidget(label: 'GitHub'),
            ActionChipWidget(label: 'Live Demo'),
            ActionChipWidget(label: 'Case Study'),
          ],
        ),
      ],
    );
  }
}
