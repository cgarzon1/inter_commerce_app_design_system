import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';


class InterCommercePromoBadge extends StatelessWidget {
  const InterCommercePromoBadge({
    super.key,
    required this.code,
    required this.detail,
    this.onRemove,
  });

  final String code;
  final String detail;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: semanticColors.promoBackground,
        borderRadius: BorderRadius.circular(InterCommerceRadius.md),
        border: Border.all(color: semanticColors.promoBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: InterCommerceSpacing.md,
          vertical: InterCommerceSpacing.sm,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${code.toUpperCase()}  ',
                      style: textTheme.labelMedium
                          ?.copyWith(color: semanticColors.promoForeground),
                    ),
                    TextSpan(
                      text: detail,
                      style: textTheme.bodySmall
                          ?.copyWith(color: semanticColors.promoForeground),
                    ),
                  ],
                ),
              ),
            ),
            if (onRemove != null)
              InkWell(
                onTap: onRemove,
                customBorder: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(InterCommerceSpacing.xxs),
                  child: Icon(Icons.close, size: 16, color: semanticColors.promoForeground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
