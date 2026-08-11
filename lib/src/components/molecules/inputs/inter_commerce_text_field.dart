import 'package:flutter/material.dart';

import '../../../foundations/inter_commerce_tokens.dart';
import '../../../theme/inter_commerce_semantic_colors.dart';


class InterCommerceTextField extends StatelessWidget {
  const InterCommerceTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.leadingIcon,
    this.trailingIcon,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final semanticColors = InterCommerceSemanticColors.of(context);

    return SizedBox(
      height: errorText == null ? InterCommerceControlSize.textField : null,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        enabled: enabled,
        autofocus: autofocus,
        textInputAction: textInputAction,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          prefixIcon: leadingIcon,
          suffixIcon: trailingIcon,
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.error),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(InterCommerceRadius.md),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(InterCommerceRadius.md),
            borderSide: BorderSide.none,
          ),
          fillColor: enabled
              ? semanticColors.inputFill
              : semanticColors.disabledBackground,
          filled: true,
        ),
      ),
    );
  }
}
