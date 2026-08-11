import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_typography.dart';

class InterCommerceEyebrow extends StatelessWidget {
  const InterCommerceEyebrow(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        color ?? Theme.of(context).colorScheme.onSurfaceVariant;
    return Text(
      text.toUpperCase(),
      style: InterCommerceTypography.eyebrow(effectiveColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
