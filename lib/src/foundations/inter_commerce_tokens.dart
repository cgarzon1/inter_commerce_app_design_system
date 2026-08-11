import 'package:flutter/widgets.dart';

/// 4pt-based spacing scale.
abstract final class InterCommerceSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

/// Corner radii — chips and circular controls use [pill].
abstract final class InterCommerceRadius {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 10;
  static const double lg = 12;
  static const double pill = 999;
}

/// Hairline stroke widths.
abstract final class InterCommerceBorderWidth {
  static const double hairline = 1;
  static const double thick = 1.4;
}

/// Type sizes. Manrope covers interface/body; Cormorant Garamond covers
/// titles/prices.
abstract final class InterCommerceFontSize {
  // Manrope.
  static const double overline = 9;
  static const double labelSmall = 10;
  static const double labelMedium = 11;
  static const double bodySmall = 12;
  static const double bodyMedium = 13;
  static const double bodyLarge = 14;
  static const double buttonLabel = 13;
  static const double interfaceMax = 16;

  // Cormorant Garamond.
  static const double titleSmall = 15;
  static const double titleMedium = 18;
  static const double titleLarge = 20;
  static const double headlineSmall = 22;
  static const double headlineMedium = 24;
  static const double headlineLarge = 28;
  static const double display = 30;
}

abstract final class InterCommerceFontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

/// Letter-spacing (tracking), in logical pixels, for uppercase labels.
abstract final class InterCommerceTracking {
  static const double tight = 0.28;
  static const double wide = 1.1;
  static const double wider = 2.2;
  static const double widest = 4.2;
}

abstract final class InterCommerceControlSize {
  static const double minimumTouchTarget = 44;
  static const double compact = minimumTouchTarget;
  static const double standard = 52;
  static const double textField = 52;
  static const double swatch = 32;
  static const double thumbnailSmall = 56;
  static const double thumbnailLarge = 96;
}

/// Low-opacity shadows for a near-flat elevation feel.
abstract final class InterCommerceElevation {
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> soft = [
    BoxShadow(color: Color(0x0A121212), blurRadius: 8, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(color: Color(0x0F121212), blurRadius: 16, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> high = [
    BoxShadow(color: Color(0x14121212), blurRadius: 26, offset: Offset(0, 8)),
  ];
}

abstract final class InterCommerceDurations {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration standard = Duration(milliseconds: 250);
  static const Duration shimmer = Duration(milliseconds: 1500);
  static const Duration addToCartPending = Duration(milliseconds: 620);
  static const Duration addToCartSuccessHold = Duration(seconds: 2);
}

abstract final class InterCommerceCurves {
  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve confirm = Curves.easeOutBack;
}

enum InterCommerceIconSize {
  small(16),
  medium(20),
  large(24),
  extraLarge(32);

  const InterCommerceIconSize(this.value);

  final double value;
}
