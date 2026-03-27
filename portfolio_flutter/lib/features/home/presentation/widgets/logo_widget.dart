import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;

  const LogoWidget({
    super.key,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Image.asset(
          'assets/logo.png',
          width: 56,
          height: 56,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Text(
            'TG',
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
        ),
      ),
    );
  }
}
