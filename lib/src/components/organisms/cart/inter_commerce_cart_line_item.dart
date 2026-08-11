import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../atoms/inter_commerce_price_text.dart';
import '../../molecules/inter_commerce_quantity_stepper.dart';


class InterCommerceCartLineItem extends StatelessWidget {
  const InterCommerceCartLineItem({
    super.key,
    required this.image,
    required this.title,
    required this.variantLabel,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
    this.removeSemanticLabel,
    this.decrementSemanticLabel,
    this.incrementSemanticLabel,
  });

  final Widget image;
  final String title;
  final String variantLabel;
  final num price;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  final String? removeSemanticLabel;
  final String? decrementSemanticLabel;
  final String? incrementSemanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: InterCommerceSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(InterCommerceRadius.md),
            child: SizedBox.square(
              dimension: InterCommerceControlSize.thumbnailSmall,
              child: image,
            ),
          ),
          const SizedBox(width: InterCommerceSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
                    ),
                    InkWell(
                      onTap: onRemove,
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(InterCommerceSpacing.xxs),
                        child: Semantics(
                          button: true,
                          label: removeSemanticLabel,
                          child: Icon(Icons.close, size: 16, color: colors.onSurfaceVariant),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(variantLabel, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: InterCommerceSpacing.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterCommerceQuantityStepper(
                      quantity: quantity,
                      onChanged: onQuantityChanged,
                      decrementSemanticLabel: decrementSemanticLabel,
                      incrementSemanticLabel: incrementSemanticLabel,
                    ),
                    InterCommercePriceText(price * quantity),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
