import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../foundations/inter_commerce_typography.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';


class InterCommerceNavItem {
  const InterCommerceNavItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.badgeCount,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final int? badgeCount;
}

class InterCommerceBottomNavBar extends StatelessWidget {
  const InterCommerceBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<InterCommerceNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final semanticColors = InterCommerceSemanticColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: semanticColors.hairline)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _NavTab(
                    item: items[i],
                    selected: i == currentIndex,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  const _NavTab({required this.item, required this.selected, required this.onTap});

  final InterCommerceNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = selected ? colors.onSurface : colors.onSurfaceVariant;

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  selected ? (item.selectedIcon ?? item.icon) : item.icon,
                  size: 20,
                  color: color,
                ),
                if (item.badgeCount != null && item.badgeCount! > 0)
                  Positioned(
                    top: -4,
                    right: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      constraints: const BoxConstraints(minWidth: 14),
                      decoration: BoxDecoration(
                        color: colors.onSurface,
                        borderRadius: BorderRadius.circular(InterCommerceRadius.pill),
                      ),
                      child: Text(
                        '${item.badgeCount}',
                        textAlign: TextAlign.center,
                        style: InterCommerceTypography.eyebrow(colors.surface)
                            .copyWith(letterSpacing: 0),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(item.label.toUpperCase(), style: InterCommerceTypography.eyebrow(color)),
          ],
        ),
      ),
    );
  }
}
