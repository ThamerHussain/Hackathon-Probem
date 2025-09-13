import 'package:flutter/material.dart';
import 'package:hackathon/src/core/extension/localization_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_startup_animation.dart';
import '../page/intro_page.dart';

class AppStartupMangeWidget extends HookConsumerWidget {
  final FutureProvider startupProvider;
  final WidgetBuilder? builder;
  const AppStartupMangeWidget(this.startupProvider, {super.key, this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleteSplash = useState(false);
    final appStartupState = ref.watch(startupProvider);
    void onCompleteSplash() {
      isCompleteSplash.value = true;
    }

    return AppStartupWidgetAnimation(
      onData: builder,
      onError: (context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(context.t.splash.unknownErrorMessage),
                  TextButton(
                    child: Text(context.t.splash.retryNow),
                    onPressed: () => ref.invalidate(startupProvider),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      '${context.t.splash.errorPrefix}${appStartupState.error}',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onLoading: (context) => IntroPage(onCompleteAnimation: onCompleteSplash),
      state: switch (appStartupState) {
        AsyncData(value: _) when isCompleteSplash.value => AppStartupState.data,
        AsyncError() => AppStartupState.error,
        _ => AppStartupState.loading,
      },
    );
  }
}
