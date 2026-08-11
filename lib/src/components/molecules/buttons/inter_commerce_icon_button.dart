import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';


class InterCommerceIconButton extends StatelessWidget {
  const InterCommerceIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.glass = true,
    this.size = InterCommerceControlSize.minimumTouchTarget,
    this.semanticLabel,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final bool glass;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);
    final background = glass ? semanticColors.glassSurface : colors.surface;

    return Semantics(
      button: true,
      label: semanticLabel,
      child: SizedBox.square(
        dimension: size,
        child: Material(
          color: background,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: Center(
              child: IconTheme.merge(
                data: IconThemeData(color: colors.onSurface, size: 20),
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
