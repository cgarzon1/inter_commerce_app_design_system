import 'package:flutter/material.dart';

import '../../foundations/inter_commerce_tokens.dart';

class InterCommerceExpandableSection extends StatefulWidget {
  const InterCommerceExpandableSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<InterCommerceExpandableSection> createState() =>
      _InterCommerceExpandableSectionState();
}

class _InterCommerceExpandableSectionState
    extends State<InterCommerceExpandableSection> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: InterCommerceSpacing.sm),
            child: Row(
              children: [
                Expanded(
                  child: Text(widget.title, style: Theme.of(context).textTheme.titleSmall),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.25 : 0,
                  duration: InterCommerceDurations.fast,
                  child: Icon(Icons.chevron_right, color: colors.onSurface, size: 20),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: InterCommerceDurations.standard,
          crossFadeState:
              _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Padding(
            padding: const EdgeInsets.only(bottom: InterCommerceSpacing.md),
            child: DefaultTextStyle.merge(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: colors.onSurfaceVariant),
              child: widget.child,
            ),
          ),
          secondChild: const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
