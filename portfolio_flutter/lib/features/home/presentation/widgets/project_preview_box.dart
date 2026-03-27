import 'package:flutter/material.dart';

class ProjectPreviewBox extends StatelessWidget {
  const ProjectPreviewBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Center(
        child: Icon(Icons.phone_android_rounded, size: 54, color: Colors.black54),
      ),
    );
  }
}
