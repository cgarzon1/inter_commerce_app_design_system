import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';

class InterCommerceOfflineBanner extends StatelessWidget {
  const InterCommerceOfflineBanner({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: semanticColors.offlineBannerBackground,
        borderRadius: BorderRadius.circular(InterCommerceRadius.md),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: InterCommerceSpacing.md,
          vertical: InterCommerceSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(right: InterCommerceSpacing.xs),
              decoration: BoxDecoration(
                color: semanticColors.offlineBannerDot,
                shape: BoxShape.circle,
              ),
            ),
            Flexible(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: semanticColors.offlineBannerForeground,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
