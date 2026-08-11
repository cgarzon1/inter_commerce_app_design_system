import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';
import '../../atoms/inter_commerce_badge.dart';
import '../../atoms/inter_commerce_eyebrow.dart';
import '../../atoms/inter_commerce_price_text.dart';


class InterCommerceProductCard extends StatelessWidget {
  const InterCommerceProductCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    this.compareAtPrice,
    this.badgeLabel,
    this.onTap,
    this.imageAspectRatio = 1.05,
  });

  final Widget image;
  final String category;
  final String title;
  final num price;
  final num? compareAtPrice;
  final String? badgeLabel;
  final VoidCallback? onTap;
  final double imageAspectRatio;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: onTap != null,
      label: '$category. $title',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: imageAspectRatio,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
                      child: image,
                    ),
                  ),
                  if (badgeLabel != null)
                    Positioned(
                      top: InterCommerceSpacing.xs,
                      right: InterCommerceSpacing.xs,
                      child: InterCommerceBadge(badgeLabel!),
                    ),
                ],
              ),
            ),
            const SizedBox(height: InterCommerceSpacing.xs),
            InterCommerceEyebrow(category, color: colors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 2),
            InterCommercePriceText(
              price,
              compareAtAmount: compareAtPrice,
              size: InterCommerceFontSize.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}


class InterCommerceProductCardSkeleton extends StatelessWidget {
  const InterCommerceProductCardSkeleton({
    super.key,
    this.imageAspectRatio = 1.05,
  });

  final double imageAspectRatio;

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);

    Widget bar(double width, double height) => DecoratedBox(
          decoration: BoxDecoration(
            color: semanticColors.skeletonBase,
            borderRadius: BorderRadius.circular(InterCommerceRadius.xs),
          ),
          child: SizedBox(width: width, height: height),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: semanticColors.skeletonBase,
              borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
            ),
          ),
        ),
        const SizedBox(height: InterCommerceSpacing.sm),
        bar(72, 10),
        const SizedBox(height: InterCommerceSpacing.xxs),
        bar(120, 10),
      ],
    );
  }
}
