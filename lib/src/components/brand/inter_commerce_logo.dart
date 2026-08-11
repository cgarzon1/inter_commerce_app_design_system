import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';
import '../../foundations/inter_commerce_typography.dart';


class InterCommerceLogo extends StatelessWidget {
  const InterCommerceLogo({
    super.key,
    required this.text,
    this.eyebrow,
    this.color,
    this.fontSize = InterCommerceFontSize.headlineMedium,
  });

  final String text;
  final String? eyebrow;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Text(eyebrow!, style: InterCommerceTypography.eyebrow(effectiveColor)),
          const SizedBox(height: InterCommerceSpacing.xxs),
        ],
        Text(
          text,
          style: InterCommerceTypography.price(
            effectiveColor,
            size: fontSize,
            weight: InterCommerceFontWeight.semiBold,
          ).copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
