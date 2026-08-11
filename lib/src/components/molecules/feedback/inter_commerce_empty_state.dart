import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';

class InterCommerceEmptyState extends StatelessWidget {
  const InterCommerceEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
  });

  final Widget icon;
  final String title;
  final String? message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: InterCommerceSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: semanticColors.hairline),
            ),
            child: IconTheme.merge(
              data: IconThemeData(color: colors.onSurfaceVariant, size: 32),
              child: Center(child: icon),
            ),
          ),
          const SizedBox(height: InterCommerceSpacing.lg),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (message != null) ...[
            const SizedBox(height: InterCommerceSpacing.xs),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (action != null) ...[
            const SizedBox(height: InterCommerceSpacing.xl),
            action!,
          ],
        ],
      ),
    );
  }
}
