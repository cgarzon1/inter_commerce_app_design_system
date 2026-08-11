import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';
import '../../foundations/inter_commerce_typography.dart';
import '../../theme/inter_commerce_semantic_colors.dart';

class InterCommerceBadge extends StatelessWidget {
  const InterCommerceBadge(
    this.label, {
    super.key,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);
    final background = backgroundColor ?? semanticColors.badgeBackground;
    final foreground = foregroundColor ?? semanticColors.badgeForeground;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(InterCommerceRadius.xs),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: InterCommerceSpacing.xs,
          vertical: InterCommerceSpacing.xxs,
        ),
        child: Text(
          label.toUpperCase(),
          style: InterCommerceTypography.eyebrow(foreground)
              .copyWith(fontSize: InterCommerceFontSize.labelSmall - 1),
        ),
      ),
    );
  }
}
