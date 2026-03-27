import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<_SkillData> _usingNowSkills = [
    _SkillData(
      label: 'DART',
      mark: 'D',
      accent: Color(0xFF0175C2),
      kind: _SkillMarkKind.square,
    ),
    _SkillData(
      label: 'KOTLIN',
      mark: 'K',
      accent: Color(0xFF7F52FF),
      kind: _SkillMarkKind.square,
    ),
    _SkillData(
      label: 'FLUTTER',
      mark: 'F',
      accent: Color(0xFF02569B),
      kind: _SkillMarkKind.shield,
    ),
    _SkillData(
      label: 'JETPACK\nCOMPOSE',
      mark: 'JC',
      accent: Color(0xFF4285F4),
      kind: _SkillMarkKind.square,
    ),
    _SkillData(
      label: 'PYTHON',
      mark: 'Py',
      accent: Color(0xFF3776AB),
      kind: _SkillMarkKind.hex,
    ),
    _SkillData(
      label: 'GIT',
      mark: '↗',
      accent: Color(0xFFF05032),
      kind: _SkillMarkKind.diamond,
    ),
    _SkillData(
      label: 'FIGMA',
      mark: 'F',
      accent: Color(0xFFF24E1E),
      secondaryAccent: Color(0xFFA259FF),
      tertiaryAccent: Color(0xFF0ACF83),
      quaternaryAccent: Color(0xFF1ABCFE),
      kind: _SkillMarkKind.figma,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final topBottomPadding = isMobile ? 72.0 : 110.0;

    return SectionContainer(
      backgroundColor: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.horizontalPadding(context),
        vertical: topBottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: SectionTitleBox(title: 'Skills')),
          SizedBox(height: isMobile ? 56 : 84),
          _SkillGroup(title: 'USING NOW:', skills: _usingNowSkills),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.title, required this.skills});

  final String title;
  final List<_SkillData> skills;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.sectionLabel.copyWith(
            fontSize: isMobile ? 18 : 22,
            letterSpacing: isMobile ? 3 : 5,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: isMobile ? 28 : 40),
        Wrap(
          spacing: isMobile ? 16 : 28,
          runSpacing: isMobile ? 28 : 40,
          children: skills
              .map((skill) => _SkillItem(skill: skill))
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.skill});

  final _SkillData skill;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final width = isMobile ? 96.0 : 118.0;
    final logoSize = isMobile ? 56.0 : 68.0;

    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SkillLogo(skill: skill, size: logoSize),
          const SizedBox(height: AppSpacing.md),
          Text(
            skill.label,
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              fontSize: isMobile ? 10.5 : 12,
              letterSpacing: isMobile ? 1.5 : 2.1,
              height: 1.35,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillLogo extends StatelessWidget {
  const _SkillLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    switch (skill.kind) {
      case _SkillMarkKind.shield:
        return _ShieldLogo(skill: skill, size: size);
      case _SkillMarkKind.square:
        return _SquareLogo(skill: skill, size: size);
      case _SkillMarkKind.script:
        return _ScriptLogo(skill: skill, size: size);
      case _SkillMarkKind.atom:
        return _AtomLogo(skill: skill, size: size);
      case _SkillMarkKind.diamond:
        return _DiamondLogo(skill: skill, size: size);
      case _SkillMarkKind.figma:
        return _FigmaLogo(skill: skill, size: size);
      case _SkillMarkKind.hex:
        return _HexLogo(skill: skill, size: size);
      case _SkillMarkKind.wave:
        return _WaveLogo(skill: skill, size: size);
      case _SkillMarkKind.leaf:
        return _LeafLogo(skill: skill, size: size);
      case _SkillMarkKind.flagCircle:
        return _FlagCircleLogo(skill: skill, size: size);
    }
  }
}

class _ShieldLogo extends StatelessWidget {
  const _ShieldLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ShieldClipper(),
      child: Container(
        width: size,
        height: size,
        color: skill.accent,
        alignment: Alignment.center,
        child: Text(
          skill.mark,
          style: TextStyle(
            fontSize: size * 0.44,
            fontWeight: FontWeight.w900,
            color: skill.foreground,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _SquareLogo extends StatelessWidget {
  const _SquareLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.82,
      height: size * 0.82,
      decoration: BoxDecoration(
        color: skill.accent,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        skill.mark,
        style: TextStyle(
          fontSize: skill.mark.length > 1 ? size * 0.28 : size * 0.44,
          fontWeight: FontWeight.w900,
          color: skill.foreground,
          height: 1,
        ),
      ),
    );
  }
}

class _ScriptLogo extends StatelessWidget {
  const _ScriptLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 0.82,
      child: Center(
        child: Text(
          'Sass',
          style: TextStyle(
            fontSize: size * 0.46,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: skill.accent,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _AtomLogo extends StatelessWidget {
  const _AtomLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    final orbitWidth = size * 0.78;
    final orbitHeight = size * 0.32;
    final stroke = size * 0.045;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Orbit(
            width: orbitWidth,
            height: orbitHeight,
            rotation: 0,
            color: skill.accent,
            stroke: stroke,
          ),
          _Orbit(
            width: orbitWidth,
            height: orbitHeight,
            rotation: 1.0,
            color: skill.accent,
            stroke: stroke,
          ),
          _Orbit(
            width: orbitWidth,
            height: orbitHeight,
            rotation: -1.0,
            color: skill.accent,
            stroke: stroke,
          ),
          Container(
            width: size * 0.14,
            height: size * 0.14,
            decoration: BoxDecoration(
              color: skill.accent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _Orbit extends StatelessWidget {
  const _Orbit({
    required this.width,
    required this.height,
    required this.rotation,
    required this.color,
    required this.stroke,
  });

  final double width;
  final double height;
  final double rotation;
  final Color color;
  final double stroke;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: stroke),
          borderRadius: BorderRadius.circular(height),
        ),
      ),
    );
  }
}

class _DiamondLogo extends StatelessWidget {
  const _DiamondLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    final boxSize = size * 0.74;

    return Transform.rotate(
      angle: 0.785398,
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          color: skill.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: -0.785398,
          child: Text(
            skill.mark,
            style: TextStyle(
              fontSize: size * 0.34,
              fontWeight: FontWeight.w900,
              color: skill.foreground,
            ),
          ),
        ),
      ),
    );
  }
}

class _FigmaLogo extends StatelessWidget {
  const _FigmaLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    final pillW = size * 0.26;
    final pillH = size * 0.26;

    Widget pill(Color color, BorderRadius radius) {
      return Container(
        width: pillW,
        height: pillH,
        decoration: BoxDecoration(color: color, borderRadius: radius),
      );
    }

    return SizedBox(
      width: size * 0.8,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              pill(
                skill.accent,
                BorderRadius.only(
                  topLeft: Radius.circular(pillW),
                  bottomLeft: Radius.circular(pillW),
                  topRight: Radius.circular(pillW),
                ),
              ),
              pill(
                skill.secondaryAccent ?? skill.accent,
                BorderRadius.only(
                  topRight: Radius.circular(pillW),
                  bottomRight: Radius.circular(pillW),
                  topLeft: Radius.circular(pillW),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              pill(
                skill.secondaryAccent ?? skill.accent,
                BorderRadius.only(
                  topLeft: Radius.circular(pillW),
                  bottomLeft: Radius.circular(pillW),
                  bottomRight: Radius.circular(pillW),
                ),
              ),
              pill(
                skill.quaternaryAccent ?? skill.accent,
                BorderRadius.circular(pillW),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              pill(
                skill.tertiaryAccent ?? skill.accent,
                BorderRadius.only(
                  topLeft: Radius.circular(pillW),
                  topRight: Radius.circular(pillW),
                  bottomLeft: Radius.circular(pillW),
                ),
              ),
              SizedBox(width: pillW),
            ],
          ),
        ],
      ),
    );
  }
}

class _HexLogo extends StatelessWidget {
  const _HexLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HexClipper(),
      child: Container(
        width: size * 0.82,
        height: size * 0.82,
        color: skill.accent,
        alignment: Alignment.center,
        child: Text(
          skill.mark,
          style: TextStyle(
            fontSize: skill.mark.length > 1 ? size * 0.26 : size * 0.38,
            fontWeight: FontWeight.w900,
            color: skill.foreground,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _WaveLogo extends StatelessWidget {
  const _WaveLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 0.82,
      height: size * 0.82,
      child: CustomPaint(
        painter: _WavePainter(color: skill.accent),
        child: Center(
          child: Text(
            skill.mark,
            style: TextStyle(
              fontSize: size * 0.34,
              fontWeight: FontWeight.w800,
              color: skill.accent,
            ),
          ),
        ),
      ),
    );
  }
}

class _LeafLogo extends StatelessWidget {
  const _LeafLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size * 0.62, size * 0.86),
      painter: _LeafPainter(color: skill.accent),
    );
  }
}

class _FlagCircleLogo extends StatelessWidget {
  const _FlagCircleLogo({required this.skill, required this.size});

  final _SkillData skill;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isUk = skill.mark == 'UK';

    return Container(
      width: size * 0.78,
      height: size * 0.78,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.antiAlias,
      child: isUk
          ? CustomPaint(
              painter: _UkFlagPainter(
                blue: skill.accent,
                red: skill.secondaryAccent ?? Colors.red,
              ),
            )
          : Column(
              children: [
                Expanded(child: Container(color: skill.accent)),
                Expanded(child: Container(color: skill.secondaryAccent)),
                Expanded(child: Container(color: skill.accent)),
              ],
            ),
    );
  }
}

class _SkillData {
  const _SkillData({
    required this.label,
    required this.mark,
    required this.accent,
    required this.kind,
    this.foreground = AppColors.white,
    this.secondaryAccent,
    this.tertiaryAccent,
    this.quaternaryAccent,
  });

  final String label;
  final String mark;
  final Color accent;
  final Color foreground;
  final _SkillMarkKind kind;
  final Color? secondaryAccent;
  final Color? tertiaryAccent;
  final Color? quaternaryAccent;
}

enum _SkillMarkKind {
  shield,
  square,
  script,
  atom,
  diamond,
  figma,
  hex,
  wave,
  leaf,
  flagCircle,
}

class _ShieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * 0.18, 0)
      ..lineTo(size.width * 0.82, 0)
      ..lineTo(size.width * 0.76, size.height * 0.85)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width * 0.24, size.height * 0.85)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _HexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * 0.25, 0)
      ..lineTo(size.width * 0.75, 0)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.25, size.height)
      ..lineTo(0, size.height * 0.5)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _WavePainter extends CustomPainter {
  const _WavePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.035;

    final path = Path()
      ..moveTo(size.width * 0.18, size.height * 0.18)
      ..cubicTo(
        size.width * 0.28,
        size.height * 0.04,
        size.width * 0.46,
        size.height * 0.12,
        size.width * 0.52,
        size.height * 0.34,
      )
      ..cubicTo(
        size.width * 0.56,
        size.height * 0.48,
        size.width * 0.6,
        size.height * 0.72,
        size.width * 0.82,
        size.height * 0.84,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => false;
}

class _LeafPainter extends CustomPainter {
  const _LeafPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..cubicTo(
        size.width * 0.95,
        size.height * 0.18,
        size.width * 1.05,
        size.height * 0.66,
        size.width * 0.5,
        size.height,
      )
      ..cubicTo(
        -size.width * 0.05,
        size.height * 0.66,
        size.width * 0.05,
        size.height * 0.18,
        size.width * 0.5,
        0,
      )
      ..close();

    canvas.drawPath(path, paint);

    final stem = Paint()
      ..color = AppColors.white.withValues(alpha: 0.32)
      ..strokeWidth = size.width * 0.045
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.16),
      Offset(size.width * 0.5, size.height * 0.86),
      stem,
    );
  }

  @override
  bool shouldRepaint(covariant _LeafPainter oldDelegate) => false;
}

class _UkFlagPainter extends CustomPainter {
  const _UkFlagPainter({required this.blue, required this.red});

  final Color blue;
  final Color red;

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = blue;
    canvas.drawRect(Offset.zero & size, bg);

    final white = Paint()
      ..color = AppColors.white
      ..strokeWidth = size.width * 0.22
      ..style = PaintingStyle.stroke;

    final redPaint = Paint()
      ..color = red
      ..strokeWidth = size.width * 0.1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), white);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), white);

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), redPaint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), redPaint);

    final whiteCross = Paint()..color = AppColors.white;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height * 0.22,
      ),
      whiteCross,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.22,
        height: size.height,
      ),
      whiteCross,
    );

    final redCross = Paint()..color = red;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height * 0.1,
      ),
      redCross,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.1,
        height: size.height,
      ),
      redCross,
    );
  }

  @override
  bool shouldRepaint(covariant _UkFlagPainter oldDelegate) => false;
}
