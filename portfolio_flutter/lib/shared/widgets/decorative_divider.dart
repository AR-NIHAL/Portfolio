import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class DecorativeDivider extends StatelessWidget {
  const DecorativeDivider({
    super.key,
    this.width = 150,
    this.color,
  });

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? AppColors.textPrimary;

    return SizedBox(
      width: width,
      child: Row(
        children: [
          Expanded(child: Container(height: 1.4, color: dividerColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Transform.rotate(
              angle: 0.78,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor, width: 1.4),
                ),
              ),
            ),
          ),
          Expanded(child: Container(height: 1.4, color: dividerColor)),
        ],
      ),
    );
  }
}
