import 'package:hackathon/src/core/extension/localization_extension.dart';
import 'package:hackathon/src/core/failure/base.dart';
import 'package:hackathon/src/design/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef AsyncVoidCallback = Future<void> Function();

class LoadingButton extends HookWidget {
  final AsyncVoidCallback? onPressed;
  final VoidCallback? onSuccess;
  final bool expanded;
  final Widget child;
  final ButtonStyle? style;
  final bool handleError;

  static final Map<int, DateTime> _lastClickTimes = {};

  const LoadingButton({
    super.key,
    required this.child,
    this.onPressed,
    this.onSuccess,
    this.expanded = false,
    this.style,
    this.handleError = true,
  });

  factory LoadingButton.icon({
    Key? key,
    required Future<void> Function()? onPressed,
    VoidCallback? onSuccess,
    required Widget icon,
    required Widget label,
    bool expanded = false,
    ButtonStyle? style,
    bool handleError = true,
    TextDirection? textDirection,
  }) {
    return LoadingButton(
      key: key,
      onPressed: onPressed,
      onSuccess: onSuccess,
      expanded: expanded,
      style: style,
      handleError: handleError,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: textDirection,
        children: [icon, const SizedBox(width: 8), label],
      ),
    );
  }

  factory LoadingButton.primary({
    Key? key,
    required Future<void> Function()? onPressed,
    VoidCallback? onSuccess,
    required Widget child,
    bool expanded = false,
    ButtonStyle? style,
    bool handleError = true,
  }) {
    final defaultPrimaryStyle = FilledButton.styleFrom(
      backgroundColor: AppPalette.primary,
      foregroundColor: AppPalette.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
    );

    return LoadingButton(
      key: key,
      onPressed: onPressed,
      onSuccess: onSuccess,
      expanded: expanded,
      style: style ?? defaultPrimaryStyle,
      handleError: handleError,
      child: child,
    );
  }

  factory LoadingButton.tonal({
    Key? key,
    required Future<void> Function()? onPressed,
    VoidCallback? onSuccess,
    required Widget child,
    bool expanded = false,
    ButtonStyle? style,
    bool handleError = true,
  }) {
    return LoadingButton(
      key: key,
      onPressed: onPressed,
      onSuccess: onSuccess,
      expanded: expanded,
      style: style,
      handleError: handleError,
      child: child,
    );
  }

  factory LoadingButton.text({
    Key? key,
    required Future<void> Function()? onPressed,
    VoidCallback? onSuccess,
    required String label,
    Color? textColor,
    bool expanded = false,
    ButtonStyle? style,
    bool handleError = true,
  }) {
    return LoadingButton(
      key: key,
      onPressed: onPressed,
      onSuccess: onSuccess,
      expanded: expanded,
      style: style,
      handleError: handleError,
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    final buttonId = useMemoized(() => Object().hashCode, []);

    Future<void> handlePress() async {
      if (onPressed == null) return;

      final now = DateTime.now();
      final lastClick = _lastClickTimes[buttonId];
      if (lastClick != null && now.difference(lastClick).inMilliseconds < 500) {
        return;
      }
      _lastClickTimes[buttonId] = now;

      if (isLoading.value) {
        return;
      }
      isLoading.value = true;
      try {
        await onPressed!.call();
        onSuccess?.call();
      } on BaseFailure catch (error) {
        if (handleError && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${error.translate(context.t)}')),
          );
        }
        rethrow;
      } finally {
        if (context.mounted) isLoading.value = false;

        if (_lastClickTimes.length > 50) {
          final cutoff = DateTime.now().subtract(Duration(minutes: 5));
          _lastClickTimes.removeWhere((_, time) => time.isBefore(cutoff));
        }
      }
    }

    return FilledButton(
      onPressed: onPressed == null
          ? null
          : isLoading.value
          ? () {}
          : handlePress,
      style:
          style ??
          (expanded
              ? FilledButton.styleFrom(minimumSize: Size(double.infinity, 48))
              : FilledButton.styleFrom(maximumSize: Size(double.infinity, 48))),
      child: isLoading.value
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : child,
    );
  }
}
