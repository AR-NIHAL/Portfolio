import 'package:flutter/widgets.dart';

import '../constants/app_spacing.dart';
import 'breakpoints.dart';

enum ScreenType { mobile, tablet, desktop, largeDesktop }

class ResponsiveHelper {
  ResponsiveHelper._();

  static ScreenType screenType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < Breakpoints.mobile) return ScreenType.mobile;
    if (width < Breakpoints.tablet) return ScreenType.tablet;
    if (width < Breakpoints.desktop) return ScreenType.desktop;
    return ScreenType.largeDesktop;
  }

  static bool isMobile(BuildContext context) =>
      screenType(context) == ScreenType.mobile;

  static bool isTablet(BuildContext context) =>
      screenType(context) == ScreenType.tablet;

  static bool isDesktop(BuildContext context) {
    final type = screenType(context);
    return type == ScreenType.desktop || type == ScreenType.largeDesktop;
  }

  static double horizontalPadding(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return AppSpacing.lg;
      case ScreenType.tablet:
        return AppSpacing.xl;
      case ScreenType.desktop:
        return 48;
      case ScreenType.largeDesktop:
        return 64;
    }
  }

  static double sectionSpacing(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return 72;
      case ScreenType.tablet:
        return 88;
      case ScreenType.desktop:
        return AppSpacing.sectionGap;
      case ScreenType.largeDesktop:
        return AppSpacing.sectionGapLarge;
    }
  }

  static double maxContentWidth(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return double.infinity;
      case ScreenType.tablet:
        return 900;
      case ScreenType.desktop:
        return 1200;
      case ScreenType.largeDesktop:
        return 1400;
    }
  }

  static double heroHeight(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return 620;
      case ScreenType.tablet:
        return 700;
      case ScreenType.desktop:
        return 760;
      case ScreenType.largeDesktop:
        return 860;
    }
  }

  static int portfolioGridCount(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return 1;
      case ScreenType.tablet:
        return 2;
      case ScreenType.desktop:
        return 3;
      case ScreenType.largeDesktop:
        return 3;
    }
  }

  static int skillsGridCount(BuildContext context) {
    switch (screenType(context)) {
      case ScreenType.mobile:
        return 2;
      case ScreenType.tablet:
        return 3;
      case ScreenType.desktop:
        return 4;
      case ScreenType.largeDesktop:
        return 4;
    }
  }

  static double clampText(double width, {
    required double min,
    required double max,
    double designWidth = 1440,
  }) {
    final scaled = (width / designWidth) * max;
    if (scaled < min) return min;
    if (scaled > max) return max;
    return scaled;
  }
}
