import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';
import '../../../utils/inter_commerce_currency_formatter.dart';

class InterCommerceSummaryRow {
  const InterCommerceSummaryRow({
    required this.label,
    this.amount,
    this.valueLabel,
    this.emphasis = false,
  }) : assert(
          amount != null || valueLabel != null,
          'Provide either amount or valueLabel.',
        );

  final String label;
  final num? amount;
  final String? valueLabel;
  final bool emphasis;
}

class InterCommerceOrderSummary extends StatelessWidget {
  const InterCommerceOrderSummary({
    super.key,
    required this.rows,
    required this.total,
    required this.totalLabel,
    this.currencySymbol = r'$',
    this.locale = 'en_US',
  });

  final List<InterCommerceSummaryRow> rows;
  final num total;

  final String totalLabel;
  final String currencySymbol;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in rows) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                row.label,
                style: textTheme.bodyMedium?.copyWith(
                  color: row.emphasis
                      ? semanticColors.discountAccent
                      : colors.onSurfaceVariant,
                ),
              ),
              Text(
                row.valueLabel ??
                    InterCommerceCurrencyFormatter.format(
                      row.amount!,
                      symbol: currencySymbol,
                      locale: locale,
                    ),
                style: textTheme.bodyMedium?.copyWith(
                  color: row.emphasis
                      ? semanticColors.discountAccent
                      : colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: InterCommerceSpacing.xxs),
        ],
        const SizedBox(height: InterCommerceSpacing.xs),
        Divider(color: semanticColors.divider),
        const SizedBox(height: InterCommerceSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(totalLabel, style: textTheme.titleSmall),
            Text(
              InterCommerceCurrencyFormatter.format(
                total,
                symbol: currencySymbol,
                locale: locale,
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: colors.onSurface),
            ),
          ],
        ),
      ],
    );
  }
}
