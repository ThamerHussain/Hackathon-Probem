import 'package:hackathon/localization/strings.g.dart';
import 'package:hackathon/src/core/extension/context_extension.dart';
import 'package:hackathon/src/design/theme/theme.dart';
import 'package:hackathon/src/design/widget/button.dart';
import 'package:hackathon/src/presentation/shared/readable_error.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    required this.error,
    this.isLoading = false,
    this.title,
    super.key,
    this.onRetry,
  });

  final Object error;
  final String? title;
  final AsyncVoidCallback? onRetry;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: (context.appSpace.xs3).toAllEdgeInsets(),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: (context.appSpace.xs3).toAllEdgeInsets(),
            decoration: BoxDecoration(
              color: context.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? context.t.unexpected_error,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    context.appSpace.xs5.gap,
                    Text(
                      errorToReadableString(error, context),
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.error,
                      ),

                      textAlign: TextAlign.center,
                    ),
                    if (onRetry != null && !isLoading)
                      Padding(
                        padding: EdgeInsets.only(top: context.appSpace.xs4),
                        child: LoadingButton.text(
                          label: context.t.retry,
                          expanded: false,
                          onPressed: () async => onRetry?.call(),
                        ),
                      )
                    else if (isLoading)
                      Padding(
                        padding: context.appSpace.xs5.toAllEdgeInsets(),
                        child: const CircularProgressIndicator(),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
