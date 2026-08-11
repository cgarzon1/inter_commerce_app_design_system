import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../atoms/inter_commerce_eyebrow.dart';
import '../../atoms/inter_commerce_price_text.dart';


class InterCommerceProductListTile extends StatelessWidget {
  const InterCommerceProductListTile({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    this.description,
    this.compareAtPrice,
    this.onTap,
  });

  final Widget image;
  final String category;
  final String title;
  final String? description;
  final num price;
  final num? compareAtPrice;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: onTap != null,
      label: '$category. $title',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(InterCommerceRadius.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: InterCommerceSpacing.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(InterCommerceRadius.md),
                child: SizedBox.square(
                  dimension: InterCommerceControlSize.thumbnailLarge,
                  child: image,
                ),
              ),
              const SizedBox(width: InterCommerceSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterCommerceEyebrow(category, color: colors.onSurfaceVariant),
                    const SizedBox(height: 2),
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    if (description != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                    const SizedBox(height: InterCommerceSpacing.xxs),
                    InterCommercePriceText(price, compareAtAmount: compareAtPrice),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
