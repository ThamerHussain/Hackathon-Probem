import 'package:hackathon/src/core/extension/context_extension.dart';
import 'package:hackathon/src/design/theme/app_space.dart';
import 'package:flutter/material.dart';

extension SnackBarExt on BuildContext {
  void showSuccessSnackBar(
    String text, {
    bool fromTop = false,
    TextStyle? style,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      CustomSnackBar.success(
        context: this,
        text: text,
        style: style,
        fromTop: fromTop,
      ),
    );
  }

  void showWarningSnackBar(String text, {bool fromTop = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      CustomSnackBar.warning(context: this, text: text, fromTop: fromTop),
    );
  }

  void showInfoSnackBar(String text) {
    ScaffoldMessenger.of(
      this,
    ).showSnackBar(CustomSnackBar.info(context: this, text: text));
  }

  void showErrorSnackBar(String error) {
    ScaffoldMessenger.of(
      this,
    ).showSnackBar(CustomSnackBar.error(context: this, text: error));
  }
}

class CustomSnackBar extends SnackBar {
  final String text;
  final BuildContext context;
  final IconData icon;
  final Color color;
  final TextStyle? style;
  final bool fromTop;
  final Color foregroundColor;

  CustomSnackBar._({
    required this.text,
    required this.context,
    required this.icon,
    required this.color,
    this.style,
    this.fromTop = false,
    required this.foregroundColor,
  }) : super(
         padding: EdgeInsetsDirectional.only(start: context.appSpace.xs3),
         behavior: SnackBarBehavior.floating,
         closeIconColor: foregroundColor,
         margin: fromTop
             ? EdgeInsets.only(
                 bottom: MediaQuery.of(context).size.height - 150,
                 right: context.appSpace.xs3,
                 left: context.appSpace.xs3,
               )
             : null,
         showCloseIcon: true,
         elevation: 0,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
         content: Row(
           spacing: context.appSpace.xs3,
           children: [
             Icon(icon, color: foregroundColor),
             Expanded(
               child: FittedBox(
                 alignment: Alignment.centerRight,
                 fit: BoxFit.scaleDown,
                 child: Text(
                   textAlign: TextAlign.start,
                   text,
                   style:
                       style ??
                       context.textTheme.bodySmall?.copyWith(
                         color: foregroundColor,
                       ),
                 ),
               ),
             ),
           ],
         ),
         backgroundColor: color,
       );

  factory CustomSnackBar.success({
    required String text,
    required BuildContext context,
    TextStyle? style,
    bool fromTop = false,
  }) => CustomSnackBar._(
    text: text,
    style: style,
    context: context,
    icon: Icons.check,
    color: context.colorScheme.surface,
    foregroundColor: context.colorScheme.onSurface,
    fromTop: fromTop,
  );

  factory CustomSnackBar.error({
    required String text,
    required BuildContext context,
  }) => CustomSnackBar._(
    text: text,
    context: context,
    icon: Icons.info,
    color: context.colorScheme.error,
    foregroundColor: context.colorScheme.onError,
  );

  factory CustomSnackBar.warning({
    required String text,
    required BuildContext context,
    bool fromTop = false,
  }) => CustomSnackBar._(
    text: text,
    context: context,
    icon: Icons.info,
    color: context.colorScheme.surfaceContainerHighest,
    fromTop: fromTop,
    foregroundColor: context.colorScheme.onSurface,
  );

  factory CustomSnackBar.info({
    required String text,
    required BuildContext context,
  }) => CustomSnackBar._(
    text: text,
    context: context,
    icon: Icons.info,
    color: context.colorScheme.surfaceContainerHighest,
    foregroundColor: context.colorScheme.onSurface,
  );
}
