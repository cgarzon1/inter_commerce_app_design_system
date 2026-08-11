import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';


class InterCommerceColorSwatch extends StatelessWidget {
  const InterCommerceColorSwatch({
    super.key,
    required this.color,
    required this.selected,
    required this.onTap,
    this.semanticLabel,
  });

  final Color color;
  final bool selected;
  final VoidCallback onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final ringColor = Theme.of(context).colorScheme.onSurface;

    return Semantics(
      button: true,
      selected: selected,
      label: semanticLabel,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(InterCommerceSpacing.xxs),
          child: SizedBox.square(
            dimension: InterCommerceControlSize.swatch,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? ringColor : Colors.transparent,
                  width: InterCommerceBorderWidth.thick,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Row of [InterCommerceColorSwatch]es for a single-select color/material
/// choice.
class InterCommerceColorSwatchGroup extends StatelessWidget {
  const InterCommerceColorSwatchGroup({
    super.key,
    required this.colors,
    required this.value,
    required this.onChanged,
    this.labelBuilder,
  });

  final List<Color> colors;
  final Color? value;
  final ValueChanged<Color> onChanged;
  final String Function(Color color)? labelBuilder;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: InterCommerceSpacing.xxs,
      children: [
        for (final color in colors)
          InterCommerceColorSwatch(
            color: color,
            selected: color == value,
            onTap: () => onChanged(color),
            semanticLabel: labelBuilder?.call(color),
          ),
      ],
    );
  }
}
