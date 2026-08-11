import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';
import '../../foundations/inter_commerce_typography.dart';
import '../../theme/inter_commerce_semantic_colors.dart';
import '../../utils/inter_commerce_currency_formatter.dart';

class InterCommercePriceText extends StatelessWidget {
  const InterCommercePriceText(
    this.amount, {
    super.key,
    this.compareAtAmount,
    this.currencySymbol = r'$',
    this.locale = 'en_US',
    this.size = InterCommerceFontSize.titleMedium,
    this.color,
  });

  final num amount;
  final num? compareAtAmount;
  final String currencySymbol;
  final String locale;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);
    final priceColor = color ?? colors.onSurface;
    final priceLabel = InterCommerceCurrencyFormatter.format(
      amount,
      symbol: currencySymbol,
      locale: locale,
    );

    if (compareAtAmount == null || compareAtAmount! <= amount) {
      return Text(priceLabel, style: InterCommerceTypography.price(priceColor, size: size));
    }

    final compareAtLabel = InterCommerceCurrencyFormatter.format(
      compareAtAmount!,
      symbol: currencySymbol,
      locale: locale,
    );

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: InterCommerceSpacing.xs,
      children: [
        Text(priceLabel, style: InterCommerceTypography.price(priceColor, size: size)),
        Text(
          compareAtLabel,
          style: InterCommerceTypography.priceCompareAt(semanticColors.priceCompareAt),
        ),
      ],
    );
  }
}
