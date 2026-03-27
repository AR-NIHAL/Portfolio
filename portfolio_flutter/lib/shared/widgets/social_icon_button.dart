import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';

class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.compact = false,
    this.onDark = false,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool compact;
  final bool onDark;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final size = widget.compact ? 36.0 : 46.0;
    final iconSize = widget.compact ? 18.0 : 20.0;
    final backgroundColor = widget.onDark
        ? (_hovered ? Colors.white.withOpacity(0.14) : Colors.white.withOpacity(0.08))
        : (_hovered ? AppColors.white : AppColors.surface);
    final borderColor = widget.onDark
        ? Colors.white.withOpacity(0.12)
        : AppColors.border.withOpacity(0.08);
    final iconColor = widget.onDark ? AppColors.white : AppColors.textPrimary;
    final shadowColor = widget.onDark ? Colors.transparent : AppColors.shadow;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: size,
          height: size,
          margin: const EdgeInsets.only(right: AppSpacing.md),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            boxShadow: [
              if (!widget.onDark)
                BoxShadow(
                  color: shadowColor,
                  blurRadius: _hovered ? 18 : 10,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          child: Icon(widget.icon, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
