import 'package:flutter/material.dart';

import '../foundations/inter_commerce_tokens.dart';
import '../foundations/inter_commerce_typography.dart';
import 'inter_commerce_color_schemes.dart';
import 'inter_commerce_semantic_colors.dart';

abstract final class InterCommerceTheme {
  static ThemeData light() => _build(
        InterCommerceColorSchemes.light,
        InterCommerceSemanticColors.light,
      );

  static ThemeData dark() => _build(
        InterCommerceColorSchemes.dark,
        InterCommerceSemanticColors.dark,
      );

  static ThemeData _build(
    ColorScheme colorScheme,
    InterCommerceSemanticColors semanticColors,
  ) {
    final textTheme = InterCommerceTypography.textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      extensions: <ThemeExtension<dynamic>>[semanticColors],
      visualDensity: VisualDensity.standard,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: InterCommerceTypography.eyebrow(colorScheme.onSurface)
            .copyWith(fontSize: InterCommerceFontSize.labelMedium),
      ),
      dividerTheme: DividerThemeData(
        color: semanticColors.divider,
        thickness: InterCommerceBorderWidth.hairline,
        space: InterCommerceSpacing.lg,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, InterCommerceControlSize.standard),
          padding: const EdgeInsets.symmetric(
            horizontal: InterCommerceSpacing.xl,
            vertical: InterCommerceSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, InterCommerceControlSize.standard),
          padding: const EdgeInsets.symmetric(
            horizontal: InterCommerceSpacing.xl,
            vertical: InterCommerceSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, InterCommerceControlSize.minimumTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: InterCommerceSpacing.md,
            vertical: InterCommerceSpacing.sm,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: semanticColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: InterCommerceSpacing.md,
          vertical: InterCommerceSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InterCommerceRadius.md),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InterCommerceRadius.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(InterCommerceRadius.md),
          borderSide: BorderSide(
            color: semanticColors.inputFocus,
            width: InterCommerceBorderWidth.thick,
          ),
        ),
        hintStyle: textTheme.bodyMedium,
        labelStyle: textTheme.bodyMedium,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
        selectedColor: colorScheme.primary,
        labelStyle: textTheme.labelMedium,
        secondaryLabelStyle:
            textTheme.labelMedium?.copyWith(color: colorScheme.onPrimary),
        side: BorderSide(color: semanticColors.hairline),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: InterCommerceSpacing.md,
          vertical: InterCommerceSpacing.xxs,
        ),
      ),
    );
  }
}
