import 'package:flutter/material.dart';

class AboutTextBlock extends StatelessWidget {
  const AboutTextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'I am a Computer Science graduate currently working in software support while building my career as a Flutter Developer. My current role has given me practical exposure to troubleshooting software issues, supporting Laravel-based systems, helping with server-side setup, and understanding how applications behave in real environments. Alongside my professional work, I am actively learning and building with Flutter to strengthen my mobile app development skills.',
      style: TextStyle(
        fontSize: 18,
        height: 1.9,
        color: Colors.black87,
      ),
    );
  }
}
