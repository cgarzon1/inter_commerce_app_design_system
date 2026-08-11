import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';

enum InterCommerceButtonVariant { solid, outline, text }


enum InterCommerceButtonState { idle, pending, success }

class InterCommerceButton extends StatefulWidget {
  const InterCommerceButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = InterCommerceButtonVariant.solid,
    this.state = InterCommerceButtonState.idle,
    this.pendingLabel,
    this.successLabel,
    this.leadingIcon,
    this.trailingIcon,
    this.expand = true,
    this.height = InterCommerceControlSize.standard,
    this.semanticLabel,
  }) : assert(
          height >= InterCommerceControlSize.minimumTouchTarget,
          'Interactive controls must be at least 44 logical pixels high.',
        );

  final String label;
  final VoidCallback? onPressed;
  final InterCommerceButtonVariant variant;
  final InterCommerceButtonState state;

  /// Copy for [InterCommerceButtonState.pending]; falls back to [label].
  final String? pendingLabel;

  /// Copy for [InterCommerceButtonState.success]; falls back to [label].
  final String? successLabel;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool expand;
  final double height;
  final String? semanticLabel;

  @override
  State<InterCommerceButton> createState() => _InterCommerceButtonState();
}

class _InterCommerceButtonState extends State<InterCommerceButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _confirmController = AnimationController(
    vsync: this,
    duration: InterCommerceDurations.standard,
    value: 1,
  );
  late final Animation<double> _scale = Tween<double>(begin: 0.94, end: 1)
      .animate(CurvedAnimation(
    parent: _confirmController,
    curve: InterCommerceCurves.confirm,
  ));

  @override
  void didUpdateWidget(covariant InterCommerceButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != InterCommerceButtonState.success &&
        widget.state == InterCommerceButtonState.success) {
      _confirmController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  bool get _enabled =>
      widget.onPressed != null && widget.state == InterCommerceButtonState.idle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    final background = _backgroundColor(colors, semanticColors);
    final foreground = _foregroundColor(colors, semanticColors);
    final effectiveLabel = switch (widget.state) {
      InterCommerceButtonState.idle => widget.label,
      InterCommerceButtonState.pending => widget.pendingLabel ?? widget.label,
      InterCommerceButtonState.success => widget.successLabel ?? widget.label,
    };

    final content = _ButtonContent(
      label: effectiveLabel,
      isLoading: widget.state == InterCommerceButtonState.pending,
      leadingIcon:
          widget.state == InterCommerceButtonState.idle ? widget.leadingIcon : null,
      trailingIcon:
          widget.state == InterCommerceButtonState.idle ? widget.trailingIcon : null,
      foregroundColor: foreground,
    );

    final button = AnimatedContainer(
      duration: InterCommerceDurations.standard,
      curve: InterCommerceCurves.standard,
      height: widget.height,
      width: widget.expand ? double.infinity : null,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
        border: widget.variant == InterCommerceButtonVariant.outline
            ? Border.all(
                color: _enabled
                    ? semanticColors.secondaryButtonBorder
                    : semanticColors.disabledBackground,
                width: InterCommerceBorderWidth.thick,
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(InterCommerceRadius.lg),
          onTap: _enabled ? widget.onPressed : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: InterCommerceSpacing.xl,
              vertical: InterCommerceSpacing.md,
            ),
            child: Center(child: content),
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      enabled: _enabled,
      label: widget.semanticLabel ?? widget.label,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) => Transform.scale(
          scale: _scale.value,
          child: child,
        ),
        child: button,
      ),
    );
  }

  Color _backgroundColor(
    ColorScheme colors,
    InterCommerceSemanticColors semanticColors,
  ) {
    if (widget.state == InterCommerceButtonState.success) {
      return semanticColors.confirmBackground;
    }
    if (widget.variant == InterCommerceButtonVariant.text) {
      return Colors.transparent;
    }
    if (widget.variant == InterCommerceButtonVariant.outline) {
      return Colors.transparent;
    }
    if (!_enabled) return semanticColors.disabledBackground;
    if (widget.state == InterCommerceButtonState.pending) {
      return semanticColors.disabledForeground;
    }
    return colors.primary;
  }

  Color _foregroundColor(
    ColorScheme colors,
    InterCommerceSemanticColors semanticColors,
  ) {
    if (widget.state == InterCommerceButtonState.success) {
      return semanticColors.confirmForeground;
    }
    if (!_enabled && widget.variant != InterCommerceButtonVariant.solid) {
      return semanticColors.disabledForeground;
    }
    return switch (widget.variant) {
      InterCommerceButtonVariant.solid =>
        _enabled ? colors.onPrimary : semanticColors.disabledForeground,
      InterCommerceButtonVariant.outline =>
        semanticColors.secondaryButtonForeground,
      InterCommerceButtonVariant.text => semanticColors.link,
    };
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.isLoading,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.foregroundColor,
  });

  final String label;
  final bool isLoading;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: foregroundColor,
        ),
      );
    }

    return IconTheme.merge(
      data: IconThemeData(color: foregroundColor, size: 18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: InterCommerceSpacing.xs),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: foregroundColor),
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: InterCommerceSpacing.xs),
            trailingIcon!,
          ],
        ],
      ),
    );
  }
}
