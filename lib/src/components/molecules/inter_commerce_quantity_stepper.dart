import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';
import '../../theme/inter_commerce_semantic_colors.dart';

class InterCommerceQuantityStepper extends StatelessWidget {
  const InterCommerceQuantityStepper({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.minQuantity = 1,
    this.maxQuantity,
    this.decrementSemanticLabel,
    this.incrementSemanticLabel,
  });

  final int quantity;
  final ValueChanged<int> onChanged;
  final int minQuantity;
  final int? maxQuantity;

  final String? decrementSemanticLabel;
  final String? incrementSemanticLabel;

  bool get _canDecrement => quantity > minQuantity;
  bool get _canIncrement => maxQuantity == null || quantity < maxQuantity!;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(InterCommerceRadius.pill),
        border: Border.all(color: semanticColors.hairline),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepButton(
            icon: Icons.remove,
            enabled: _canDecrement,
            onPressed: () => onChanged(quantity - 1),
            semanticLabel: decrementSemanticLabel,
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: colors.onSurface),
            ),
          ),
          _StepButton(
            icon: Icons.add,
            enabled: _canIncrement,
            onPressed: () => onChanged(quantity + 1),
            semanticLabel: incrementSemanticLabel,
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
    required this.semanticLabel,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    return SizedBox.square(
      dimension: 32,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: enabled ? onPressed : null,
          child: Semantics(
            button: true,
            enabled: enabled,
            label: semanticLabel,
            child: Icon(
              icon,
              size: 16,
              color: enabled ? colors.onSurface : semanticColors.disabledForeground,
            ),
          ),
        ),
      ),
    );
  }
}
