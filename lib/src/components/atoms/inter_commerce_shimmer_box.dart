import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';
import '../../theme/inter_commerce_semantic_colors.dart';

class InterCommerceShimmerBox extends StatefulWidget {
  const InterCommerceShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = InterCommerceRadius.md,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  State<InterCommerceShimmerBox> createState() => _InterCommerceShimmerBoxState();
}

class _InterCommerceShimmerBoxState extends State<InterCommerceShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: InterCommerceDurations.shimmer,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final t = _controller.value;
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1 + 2 * t - 0.6, -0.3),
                  end: Alignment(-1 + 2 * t + 0.6, 0.3),
                  colors: [
                    semanticColors.skeletonBase,
                    semanticColors.skeletonHighlight,
                    semanticColors.skeletonBase,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
