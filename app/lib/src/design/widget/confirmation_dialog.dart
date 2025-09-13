import 'package:hackathon/src/core/extension/localization_extension.dart';
import 'package:hackathon/src/design/theme/app_palette.dart';
import 'package:hackathon/src/design/widget/button.dart';
import 'package:flutter/material.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final bool barrierDismissible;

  const ConfirmationDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.barrierDismissible = false,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
    required String cancelText,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    bool barrierDismissible = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ConfirmationDialogWidget(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmButtonColor: confirmButtonColor,
        cancelButtonColor: cancelButtonColor,
        barrierDismissible: barrierDismissible,
        onConfirm: () => Navigator.of(context).pop(true),
        onCancel: () => Navigator.of(context).pop(false),
      ),
    );
  }

  static Future<bool?> showLogout(BuildContext context) {
    return show(
      context,
      title: context.t.loggingOut,
      message: context.t.logoutConfirmation,
      confirmText: context.t.logout,
      cancelText: context.t.cancel,
      confirmButtonColor: AppPalette.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppPalette.grayscale,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppPalette.white),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppPalette.white),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: LoadingButton(
                    expanded: true,
                    style: FilledButton.styleFrom(
                      backgroundColor: confirmButtonColor ?? AppPalette.primary,
                      foregroundColor: AppPalette.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      onConfirm?.call();
                    },
                    child: Text(
                      confirmText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppPalette.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: LoadingButton(
                    expanded: true,
                    style: FilledButton.styleFrom(
                      backgroundColor: cancelButtonColor ?? AppPalette.grey600,
                      foregroundColor: AppPalette.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.60,
                          color: Colors.white.withValues(alpha: 0.60),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      onCancel?.call();
                    },
                    child: Text(
                      cancelText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
