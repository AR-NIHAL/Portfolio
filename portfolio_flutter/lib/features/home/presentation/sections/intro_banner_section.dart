import 'package:flutter/material.dart';

class IntroBannerSection extends StatelessWidget {
  const IntroBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1C1C1C),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABOUT THIS PORTFOLIO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'I am a Junior Flutter Developer with practical experience in software support, troubleshooting, Laravel setup, and deployment assistance. This portfolio highlights my development work, technical foundations, and my growth toward building clean and reliable digital products.',
                style: TextStyle(
                  color: Color(0xFFD5D5D5),
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'READ MORE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.3,
                    ),
                  ),
                  SizedBox(width: 14),
                  SizedBox(
                    width: 70,
                    child: Divider(color: Colors.white, thickness: 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
