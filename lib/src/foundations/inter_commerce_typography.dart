import 'package:flutter/material.dart';

import 'inter_commerce_tokens.dart';

abstract final class InterCommerceTypography {
  static const String serifFamily = 'ICCormorantGaramond';
  static const String sansFamily = 'ICManrope';
  static const String _fontPackage = 'inter_commerce_app_design_system';

  static TextStyle _serif({
    required double size,
    required double height,
    FontWeight weight = InterCommerceFontWeight.regular,
    Color? color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: serifFamily,
      package: _fontPackage,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: 0,
    );
  }

  static TextStyle _sans({
    required double size,
    required double height,
    FontWeight weight = InterCommerceFontWeight.regular,
    double letterSpacing = 0,
    Color? color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: sansFamily,
      package: _fontPackage,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextTheme textTheme(ColorScheme colors) {
    return TextTheme(
      displayLarge: _serif(
        size: InterCommerceFontSize.display,
        height: 1.15,
        weight: InterCommerceFontWeight.semiBold,
        color: colors.onSurface,
      ),
      displayMedium: _serif(
        size: InterCommerceFontSize.headlineLarge,
        height: 1.2,
        weight: InterCommerceFontWeight.semiBold,
        color: colors.onSurface,
      ),
      displaySmall: _serif(
        size: InterCommerceFontSize.headlineMedium,
        height: 1.2,
        weight: InterCommerceFontWeight.semiBold,
        color: colors.onSurface,
      ),
      headlineLarge: _serif(
        size: InterCommerceFontSize.headlineLarge,
        height: 1.25,
        weight: InterCommerceFontWeight.semiBold,
        color: colors.onSurface,
      ),
      headlineMedium: _serif(
        size: InterCommerceFontSize.headlineMedium,
        height: 1.3,
        weight: InterCommerceFontWeight.medium,
        color: colors.onSurface,
      ),
      headlineSmall: _serif(
        size: InterCommerceFontSize.headlineSmall,
        height: 1.3,
        weight: InterCommerceFontWeight.medium,
        color: colors.onSurface,
      ),
      titleLarge: _serif(
        size: InterCommerceFontSize.titleLarge,
        height: 1.3,
        weight: InterCommerceFontWeight.semiBold,
        color: colors.onSurface,
      ),
      titleMedium: _serif(
        size: InterCommerceFontSize.titleMedium,
        height: 1.35,
        weight: InterCommerceFontWeight.medium,
        color: colors.onSurface,
      ),
      titleSmall: _serif(
        size: InterCommerceFontSize.titleSmall,
        height: 1.4,
        weight: InterCommerceFontWeight.medium,
        color: colors.onSurface,
      ),
      bodyLarge: _sans(
        size: InterCommerceFontSize.bodyLarge,
        height: 1.55,
        color: colors.onSurface,
      ),
      bodyMedium: _sans(
        size: InterCommerceFontSize.bodyMedium,
        height: 1.5,
        color: colors.onSurfaceVariant,
      ),
      bodySmall: _sans(
        size: InterCommerceFontSize.bodySmall,
        height: 1.45,
        color: colors.onSurfaceVariant,
      ),
      labelLarge: _sans(
        size: InterCommerceFontSize.buttonLabel,
        height: 1.2,
        weight: InterCommerceFontWeight.semiBold,
        letterSpacing: InterCommerceTracking.wide,
        color: colors.onSurface,
      ),
      labelMedium: _sans(
        size: InterCommerceFontSize.labelMedium,
        height: 1.3,
        weight: InterCommerceFontWeight.semiBold,
        letterSpacing: InterCommerceTracking.wider,
        color: colors.onSurfaceVariant,
      ),
      labelSmall: _sans(
        size: InterCommerceFontSize.labelSmall,
        height: 1.3,
        weight: InterCommerceFontWeight.semiBold,
        letterSpacing: InterCommerceTracking.wider,
        color: colors.onSurfaceVariant,
      ),
    );
  }

  /// Widest tracking in the system; always uppercase.
  static TextStyle eyebrow(Color color) => _sans(
        size: InterCommerceFontSize.overline,
        height: 1.4,
        weight: InterCommerceFontWeight.semiBold,
        letterSpacing: InterCommerceTracking.widest,
        color: color,
      );

  /// Serif price style. [size] defaults to the list/detail price size;
  /// pass [InterCommerceFontSize.headlineSmall] or larger for hero pricing.
  static TextStyle price(
    Color color, {
    double size = InterCommerceFontSize.titleMedium,
    FontWeight weight = InterCommerceFontWeight.semiBold,
  }) =>
      _serif(size: size, height: 1.2, weight: weight, color: color);

  /// Struck-through compare-at price, shown next to [price].
  static TextStyle priceCompareAt(Color color) => _serif(
        size: InterCommerceFontSize.bodyLarge,
        height: 1.2,
        weight: InterCommerceFontWeight.regular,
        color: color,
      ).copyWith(decoration: TextDecoration.lineThrough);
}
