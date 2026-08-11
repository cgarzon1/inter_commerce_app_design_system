import 'package:flutter/material.dart';

import '../foundations/inter_commerce_color_primitives.dart';

@immutable
class InterCommerceSemanticColors
    extends ThemeExtension<InterCommerceSemanticColors> {
  const InterCommerceSemanticColors({
    required this.divider,
    required this.hairline,
    required this.inputFill,
    required this.inputFocus,
    required this.disabledBackground,
    required this.disabledForeground,
    required this.secondaryButtonForeground,
    required this.secondaryButtonBorder,
    required this.link,
    required this.glassSurface,
    required this.scrim,
    required this.skeletonBase,
    required this.skeletonHighlight,
    required this.confirmBackground,
    required this.confirmForeground,
    required this.badgeBackground,
    required this.badgeForeground,
    required this.offlineBannerBackground,
    required this.offlineBannerForeground,
    required this.offlineBannerDot,
    required this.promoBackground,
    required this.promoForeground,
    required this.promoBorder,
    required this.priceCompareAt,
    required this.discountAccent,
    required this.placeholderBackground,
    required this.placeholderForeground,
  });

  final Color divider;
  final Color hairline;
  final Color inputFill;
  final Color inputFocus;
  final Color disabledBackground;
  final Color disabledForeground;

  /// Foreground for the outline button variant; border uses
  /// [secondaryButtonBorder].
  final Color secondaryButtonForeground;
  final Color secondaryButtonBorder;
  final Color link;

  /// Translucent surface for controls floating over imagery.
  final Color glassSurface;
  final Color scrim;
  final Color skeletonBase;
  final Color skeletonHighlight;

  /// Success/confirmation accent (sage).
  final Color confirmBackground;
  final Color confirmForeground;
  final Color badgeBackground;
  final Color badgeForeground;
  final Color offlineBannerBackground;
  final Color offlineBannerForeground;
  final Color offlineBannerDot;
  final Color promoBackground;
  final Color promoForeground;
  final Color promoBorder;
  final Color priceCompareAt;
  final Color discountAccent;
  final Color placeholderBackground;
  final Color placeholderForeground;

  static const InterCommerceSemanticColors light = InterCommerceSemanticColors(
    divider: Color(InterCommerceColorPrimitives.shell),
    hairline: Color(InterCommerceColorPrimitives.shell),
    inputFill: Color(InterCommerceColorPrimitives.linen),
    inputFocus: Color(InterCommerceColorPrimitives.ink),
    disabledBackground: Color(InterCommerceColorPrimitives.parchment),
    disabledForeground: Color(InterCommerceColorPrimitives.stone),
    secondaryButtonForeground: Color(InterCommerceColorPrimitives.ink),
    secondaryButtonBorder: Color(InterCommerceColorPrimitives.taupeMist),
    link: Color(InterCommerceColorPrimitives.earthDark),
    glassSurface: Color(InterCommerceColorPrimitives.glassLight),
    scrim: Color(InterCommerceColorPrimitives.scrimLight),
    skeletonBase: Color(InterCommerceColorPrimitives.parchment),
    skeletonHighlight: Color(InterCommerceColorPrimitives.linen),
    confirmBackground: Color(InterCommerceColorPrimitives.sage),
    confirmForeground: Color(InterCommerceColorPrimitives.bone),
    badgeBackground: Color(InterCommerceColorPrimitives.ink),
    badgeForeground: Color(InterCommerceColorPrimitives.bone),
    offlineBannerBackground: Color(InterCommerceColorPrimitives.ochreLight),
    offlineBannerForeground: Color(InterCommerceColorPrimitives.ochre),
    offlineBannerDot: Color(InterCommerceColorPrimitives.ochre),
    promoBackground: Color(InterCommerceColorPrimitives.parchment),
    promoForeground: Color(InterCommerceColorPrimitives.earthDark),
    promoBorder: Color(InterCommerceColorPrimitives.taupeMist),
    priceCompareAt: Color(InterCommerceColorPrimitives.stone),
    discountAccent: Color(InterCommerceColorPrimitives.earth),
    placeholderBackground: Color(InterCommerceColorPrimitives.parchment),
    placeholderForeground: Color(InterCommerceColorPrimitives.fossil),
  );

  static const InterCommerceSemanticColors dark = InterCommerceSemanticColors(
    divider: Color(InterCommerceColorPrimitives.charcoal),
    hairline: Color(InterCommerceColorPrimitives.charcoal),
    inputFill: Color(InterCommerceColorPrimitives.inkSurfaceRaised),
    inputFocus: Color(InterCommerceColorPrimitives.bone),
    disabledBackground: Color(InterCommerceColorPrimitives.inkSurfaceOverlay),
    disabledForeground: Color(InterCommerceColorPrimitives.fossil),
    secondaryButtonForeground: Color(InterCommerceColorPrimitives.bone),
    secondaryButtonBorder: Color(InterCommerceColorPrimitives.charcoal),
    link: Color(InterCommerceColorPrimitives.roseGoldLight),
    glassSurface: Color(InterCommerceColorPrimitives.glassDark),
    scrim: Color(InterCommerceColorPrimitives.scrimDark),
    skeletonBase: Color(InterCommerceColorPrimitives.inkSurfaceRaised),
    skeletonHighlight: Color(InterCommerceColorPrimitives.inkSurfaceOverlay),
    confirmBackground: Color(InterCommerceColorPrimitives.sageDark),
    confirmForeground: Color(InterCommerceColorPrimitives.linen),
    badgeBackground: Color(InterCommerceColorPrimitives.bone),
    badgeForeground: Color(InterCommerceColorPrimitives.ink),
    offlineBannerBackground: Color(InterCommerceColorPrimitives.inkSurfaceOverlay),
    offlineBannerForeground: Color(InterCommerceColorPrimitives.ochreDark),
    offlineBannerDot: Color(InterCommerceColorPrimitives.ochreDark),
    promoBackground: Color(InterCommerceColorPrimitives.inkSurfaceOverlay),
    promoForeground: Color(InterCommerceColorPrimitives.roseGoldLight),
    promoBorder: Color(InterCommerceColorPrimitives.charcoal),
    priceCompareAt: Color(InterCommerceColorPrimitives.fossil),
    discountAccent: Color(InterCommerceColorPrimitives.earthLight),
    placeholderBackground: Color(InterCommerceColorPrimitives.inkSurfaceOverlay),
    placeholderForeground: Color(InterCommerceColorPrimitives.stone),
  );

  static InterCommerceSemanticColors of(BuildContext context) {
    final theme = Theme.of(context);
    return theme.extension<InterCommerceSemanticColors>() ??
        (theme.brightness == Brightness.dark ? dark : light);
  }

  @override
  InterCommerceSemanticColors copyWith({
    Color? divider,
    Color? hairline,
    Color? inputFill,
    Color? inputFocus,
    Color? disabledBackground,
    Color? disabledForeground,
    Color? secondaryButtonForeground,
    Color? secondaryButtonBorder,
    Color? link,
    Color? glassSurface,
    Color? scrim,
    Color? skeletonBase,
    Color? skeletonHighlight,
    Color? confirmBackground,
    Color? confirmForeground,
    Color? badgeBackground,
    Color? badgeForeground,
    Color? offlineBannerBackground,
    Color? offlineBannerForeground,
    Color? offlineBannerDot,
    Color? promoBackground,
    Color? promoForeground,
    Color? promoBorder,
    Color? priceCompareAt,
    Color? discountAccent,
    Color? placeholderBackground,
    Color? placeholderForeground,
  }) {
    return InterCommerceSemanticColors(
      divider: divider ?? this.divider,
      hairline: hairline ?? this.hairline,
      inputFill: inputFill ?? this.inputFill,
      inputFocus: inputFocus ?? this.inputFocus,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      disabledForeground: disabledForeground ?? this.disabledForeground,
      secondaryButtonForeground:
          secondaryButtonForeground ?? this.secondaryButtonForeground,
      secondaryButtonBorder:
          secondaryButtonBorder ?? this.secondaryButtonBorder,
      link: link ?? this.link,
      glassSurface: glassSurface ?? this.glassSurface,
      scrim: scrim ?? this.scrim,
      skeletonBase: skeletonBase ?? this.skeletonBase,
      skeletonHighlight: skeletonHighlight ?? this.skeletonHighlight,
      confirmBackground: confirmBackground ?? this.confirmBackground,
      confirmForeground: confirmForeground ?? this.confirmForeground,
      badgeBackground: badgeBackground ?? this.badgeBackground,
      badgeForeground: badgeForeground ?? this.badgeForeground,
      offlineBannerBackground:
          offlineBannerBackground ?? this.offlineBannerBackground,
      offlineBannerForeground:
          offlineBannerForeground ?? this.offlineBannerForeground,
      offlineBannerDot: offlineBannerDot ?? this.offlineBannerDot,
      promoBackground: promoBackground ?? this.promoBackground,
      promoForeground: promoForeground ?? this.promoForeground,
      promoBorder: promoBorder ?? this.promoBorder,
      priceCompareAt: priceCompareAt ?? this.priceCompareAt,
      discountAccent: discountAccent ?? this.discountAccent,
      placeholderBackground:
          placeholderBackground ?? this.placeholderBackground,
      placeholderForeground:
          placeholderForeground ?? this.placeholderForeground,
    );
  }

  @override
  InterCommerceSemanticColors lerp(
    covariant InterCommerceSemanticColors? other,
    double t,
  ) {
    if (other == null) return this;
    return InterCommerceSemanticColors(
      divider: Color.lerp(divider, other.divider, t)!,
      hairline: Color.lerp(hairline, other.hairline, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      inputFocus: Color.lerp(inputFocus, other.inputFocus, t)!,
      disabledBackground:
          Color.lerp(disabledBackground, other.disabledBackground, t)!,
      disabledForeground:
          Color.lerp(disabledForeground, other.disabledForeground, t)!,
      secondaryButtonForeground: Color.lerp(
        secondaryButtonForeground,
        other.secondaryButtonForeground,
        t,
      )!,
      secondaryButtonBorder:
          Color.lerp(secondaryButtonBorder, other.secondaryButtonBorder, t)!,
      link: Color.lerp(link, other.link, t)!,
      glassSurface: Color.lerp(glassSurface, other.glassSurface, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      skeletonBase: Color.lerp(skeletonBase, other.skeletonBase, t)!,
      skeletonHighlight:
          Color.lerp(skeletonHighlight, other.skeletonHighlight, t)!,
      confirmBackground:
          Color.lerp(confirmBackground, other.confirmBackground, t)!,
      confirmForeground:
          Color.lerp(confirmForeground, other.confirmForeground, t)!,
      badgeBackground: Color.lerp(badgeBackground, other.badgeBackground, t)!,
      badgeForeground: Color.lerp(badgeForeground, other.badgeForeground, t)!,
      offlineBannerBackground: Color.lerp(
        offlineBannerBackground,
        other.offlineBannerBackground,
        t,
      )!,
      offlineBannerForeground: Color.lerp(
        offlineBannerForeground,
        other.offlineBannerForeground,
        t,
      )!,
      offlineBannerDot:
          Color.lerp(offlineBannerDot, other.offlineBannerDot, t)!,
      promoBackground: Color.lerp(promoBackground, other.promoBackground, t)!,
      promoForeground: Color.lerp(promoForeground, other.promoForeground, t)!,
      promoBorder: Color.lerp(promoBorder, other.promoBorder, t)!,
      priceCompareAt: Color.lerp(priceCompareAt, other.priceCompareAt, t)!,
      discountAccent: Color.lerp(discountAccent, other.discountAccent, t)!,
      placeholderBackground: Color.lerp(
        placeholderBackground,
        other.placeholderBackground,
        t,
      )!,
      placeholderForeground: Color.lerp(
        placeholderForeground,
        other.placeholderForeground,
        t,
      )!,
    );
  }
}

extension InterCommerceThemeContext on BuildContext {
  InterCommerceSemanticColors get interCommerceColors =>
      InterCommerceSemanticColors.of(this);
}
