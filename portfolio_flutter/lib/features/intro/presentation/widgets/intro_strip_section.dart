import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/section_container.dart';

class IntroStripSection extends StatefulWidget {
  const IntroStripSection({super.key});

  @override
  State<IntroStripSection> createState() => _IntroStripSectionState();
}

class _IntroStripSectionState extends State<IntroStripSection>
    with SingleTickerProviderStateMixin {
  bool _showMore = false;

  void _toggleExpanded() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final horizontalPadding = ResponsiveHelper.horizontalPadding(context);

    return SectionContainer(
      backgroundColor: AppColors.black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 64 : 88,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionEyebrow(isMobile: isMobile),
          SizedBox(height: isMobile ? 28 : 36),
          _MainIntroText(isMobile: isMobile),
          SizedBox(height: isMobile ? 28 : 36),
          _DividerLine(isMobile: isMobile),
          SizedBox(height: isMobile ? 22 : 28),
          _ReadMoreButton(
            isMobile: isMobile,
            expanded: _showMore,
            onTap: _toggleExpanded,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 220),
              opacity: _showMore ? 1 : 0,
              child: _showMore
                  ? Padding(
                      padding: EdgeInsets.only(top: isMobile ? 28 : 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ExpandedText(isMobile: isMobile),
                          SizedBox(height: isMobile ? 28 : 34),
                          _StatsHighlights(isMobile: isMobile),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionEyebrow extends StatelessWidget {
  const _SectionEyebrow({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'IT BERRIES',
          style: AppTextStyles.sectionLabel.copyWith(
            color: AppColors.white,
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.w800,
            letterSpacing: isMobile ? 3.2 : 5.0,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(height: 1, color: AppColors.white.withOpacity(0.16)),
        ),
      ],
    );
  }
}

class _MainIntroText extends StatelessWidget {
  const _MainIntroText({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 900),
      child: Text(
        'I work at the intersection of technical support, troubleshooting, and product improvement.\n'
        'I currently support SaaS and web applications in production, where I investigate issues, reproduce bugs, analyze APIs, and help users solve real business problems. Alongside support, I am building my skills in Flutter and software quality so I can contribute not only to fixing problems, but also to building better products from the start.',
        style: AppTextStyles.body.copyWith(
          color: AppColors.white.withOpacity(0.90),
          fontSize: isMobile ? 14 : 16,
          height: isMobile ? 1.9 : 1.95,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _ExpandedText extends StatelessWidget {
  const _ExpandedText({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 860),
      child: Text(
        'My background in support gives me a practical view of how software behaves outside ideal conditions. '
        'It has taught me to think beyond the bug itself and focus on reliability, clarity, user impact, and long-term product quality. '
        'That perspective now shapes the way I approach development, testing, and continuous improvement.',
        style: AppTextStyles.body.copyWith(
          color: AppColors.white.withOpacity(0.72),
          fontSize: isMobile ? 13.5 : 15,
          height: 1.85,
          letterSpacing: 0.15,
        ),
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 120 : 160,
      height: 1,
      color: AppColors.white.withOpacity(0.28),
    );
  }
}

class _ReadMoreButton extends StatefulWidget {
  const _ReadMoreButton({
    required this.isMobile,
    required this.expanded,
    required this.onTap,
  });

  final bool isMobile;
  final bool expanded;
  final VoidCallback onTap;

  @override
  State<_ReadMoreButton> createState() => _ReadMoreButtonState();
}

class _ReadMoreButtonState extends State<_ReadMoreButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = _hovered
        ? AppColors.white
        : AppColors.white.withOpacity(0.58);

    final backgroundColor = _hovered
        ? AppColors.white.withOpacity(0.08)
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 14 : 16,
            vertical: widget.isMobile ? 12 : 13,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 1.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.expanded ? 'READ LESS' : 'READ MORE',
                style: AppTextStyles.button.copyWith(
                  color: AppColors.white,
                  fontSize: widget.isMobile ? 11 : 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: widget.isMobile ? 2.0 : 2.4,
                ),
              ),
              const SizedBox(width: 12),
              AnimatedRotation(
                turns: widget.expanded ? 0.125 : 0,
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  widget.expanded ? Icons.remove : Icons.add,
                  size: 18,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsHighlights extends StatelessWidget {
  const _StatsHighlights({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final items = const [
      _HighlightData(number: '500+', title: 'support tickets resolved'),
      _HighlightData(number: '90%+', title: 'positive client satisfaction'),
      _HighlightData(
        number: 'SaaS / API / MySQL',
        title: 'Linux & cPanel experience',
        compact: true,
      ),
    ];

    if (isMobile) {
      return Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _PremiumHighlightCard(data: item, isMobile: true),
              ),
            )
            .toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _PremiumHighlightCard(data: item, isMobile: false),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _PremiumHighlightCard extends StatelessWidget {
  const _PremiumHighlightCard({required this.data, required this.isMobile});

  final _HighlightData data;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 112 : 132),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 20,
        vertical: isMobile ? 18 : 22,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.03),
        border: Border.all(color: AppColors.white.withOpacity(0.10), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 1,
            color: AppColors.white.withOpacity(0.60),
          ),
          const SizedBox(height: 16),
          Text(
            data.number,
            style: AppTextStyles.sectionLabel.copyWith(
              color: AppColors.white,
              fontSize: data.compact
                  ? (isMobile ? 16 : 18)
                  : (isMobile ? 24 : 28),
              fontWeight: FontWeight.w800,
              letterSpacing: data.compact ? 1.2 : 1.8,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            style: AppTextStyles.body.copyWith(
              color: AppColors.white.withOpacity(0.76),
              fontSize: isMobile ? 12.5 : 13.5,
              height: 1.65,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _HighlightData {
  const _HighlightData({
    required this.number,
    required this.title,
    this.compact = false,
  });

  final String number;
  final String title;
  final bool compact;
}
