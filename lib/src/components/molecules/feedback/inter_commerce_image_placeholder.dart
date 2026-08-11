import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';
import '../buttons/inter_commerce_button.dart';

class InterCommerceImagePlaceholder extends StatelessWidget {
  const InterCommerceImagePlaceholder({
    super.key,
    required this.title,
    this.fileName,
    this.onRetry,
    this.retryLabel,
    this.borderRadius = InterCommerceRadius.lg,
  }) : assert(
          onRetry == null || retryLabel != null,
          'Provide retryLabel when onRetry is set.',
        );

  final String title;
  final String? fileName;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: semanticColors.placeholderBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(InterCommerceSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: semanticColors.placeholderForeground),
              ),
              child: Icon(
                Icons.question_mark_rounded,
                size: 18,
                color: semanticColors.placeholderForeground,
              ),
            ),
            const SizedBox(height: InterCommerceSpacing.md),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: colors.onSurface),
            ),
            if (fileName != null) ...[
              const SizedBox(height: InterCommerceSpacing.xxs),
              Text(
                fileName!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: InterCommerceSpacing.md),
              InterCommerceButton(
                label: retryLabel!,
                variant: InterCommerceButtonVariant.outline,
                expand: false,
                height: InterCommerceControlSize.minimumTouchTarget,
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
