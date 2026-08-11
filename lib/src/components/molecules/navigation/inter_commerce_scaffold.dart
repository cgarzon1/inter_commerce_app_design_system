import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import 'inter_commerce_bottom_nav_bar.dart';

class InterCommerceScaffold extends StatelessWidget {
  const InterCommerceScaffold({
    super.key,
    this.title,
    this.titleWidget,
    required this.body,
    this.scrollable = false,
    this.showBackButton = true,
    this.leading,
    this.onBackPressed,
    this.backButtonTooltip,
    this.actions,
    this.bottomNavigationBar,
    this.footer,
    this.footerPadding,
    this.backgroundColor,
    this.padding,
  }) : assert(
          title == null || titleWidget == null,
          'Use "title" for plain text or "titleWidget" for a custom widget, not both.',
        );

  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final bool scrollable;
  final bool showBackButton;
  final Widget? leading;
  final VoidCallback? onBackPressed;

  final String? backButtonTooltip;
  final List<Widget>? actions;
  final InterCommerceBottomNavBar? bottomNavigationBar;
  final Widget? footer;
  final EdgeInsetsGeometry? footerPadding;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasAppBar =
        title != null || titleWidget != null || showBackButton || actions != null;

    return Scaffold(
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      appBar: hasAppBar
          ? AppBar(
              centerTitle: false,
              leading: _buildLeading(context),
              title: titleWidget ?? (title != null ? Text(title!) : null),
              actions: actions,
            )
          : null,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(child: _buildBody()),
            if (footer != null)
              Padding(
                padding: footerPadding ??
                    const EdgeInsets.fromLTRB(
                      InterCommerceSpacing.xl,
                      InterCommerceSpacing.md,
                      InterCommerceSpacing.xl,
                      InterCommerceSpacing.md,
                    ),
                child: footer,
              ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;
    if (!showBackButton) return null;
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
      tooltip: backButtonTooltip,
      onPressed: onBackPressed ?? () => Navigator.maybePop(context),
    );
  }

  Widget _buildBody() {
    Widget content = body;
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }
    if (scrollable) {
      content = SingleChildScrollView(child: content);
    }
    return content;
  }
}
