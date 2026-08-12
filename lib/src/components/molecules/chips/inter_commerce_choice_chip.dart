import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';

enum InterCommerceChipShape { pill, rounded }

class InterCommerceChoiceChip extends StatelessWidget {
  const InterCommerceChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.shape = InterCommerceChipShape.pill,
    this.enabled = true,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final InterCommerceChipShape shape;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    final background = !enabled
        ? semanticColors.disabledBackground
        : selected
            ? colors.primary
            : Colors.transparent;
    final foreground = !enabled
        ? semanticColors.disabledForeground
        : selected
            ? colors.onPrimary
            : colors.onSurface;
    final border = selected ? background : semanticColors.hairline;
    final radius = shape == InterCommerceChipShape.pill
        ? InterCommerceRadius.pill
        : InterCommerceRadius.sm;

    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      label: label,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: border, width: InterCommerceBorderWidth.hairline),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: enabled ? () => onSelected?.call(!selected) : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: InterCommerceControlSize.minimumTouchTarget,
              minWidth: InterCommerceControlSize.minimumTouchTarget,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: InterCommerceSpacing.md,
              ),
              child: Center(
                child: Text(
                  label,
                  style:
                      Theme.of(context).textTheme.labelMedium?.copyWith(color: foreground),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Single-select, horizontally scrollable row of [InterCommerceChoiceChip]s
/// e.g. category filters or a size picker. Never wraps to a second line —
/// the row scrolls instead, so it stays a fixed height no matter how many
/// [options] there are.
class InterCommerceChipGroup<T> extends StatelessWidget {
  const InterCommerceChipGroup({
    super.key,
    required this.options,
    required this.labelBuilder,
    required this.value,
    required this.onChanged,
    this.shape = InterCommerceChipShape.pill,
    this.spacing = InterCommerceSpacing.xs,
  });

  final List<T> options;
  final String Function(T option) labelBuilder;
  final T? value;
  final ValueChanged<T> onChanged;
  final InterCommerceChipShape shape;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0) SizedBox(width: spacing),
            InterCommerceChoiceChip(
              label: labelBuilder(options[i]),
              selected: options[i] == value,
              shape: shape,
              onSelected: (_) => onChanged(options[i]),
            ),
          ],
        ],
      ),
    );
  }
}
