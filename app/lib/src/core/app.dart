import 'package:hackathon/localization/strings.g.dart';
import 'package:hackathon/src/core/route.dart';
import 'package:hackathon/src/core/utils/prevent_double_tab.dart';
import 'package:hackathon/src/design/theme/app_theme.dart';
import 'package:hackathon/src/core/provider/theme_provider.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appRouter = ref.watch(appRouterProvider);
        final themeMode = ref.watch(themeModeProvider);

        return MaterialApp.router(
          routerConfig: appRouter.config(),
          builder: (context, child) {
            final child2 = DevicePreview.appBuilder(context, child);
            final MediaQueryData data = MediaQuery.of(context);
            final isSmallWidth = data.size.width < 400;
            return OnlyOnePointerRecognizerWidget(
              child: MediaQuery(
                data: data.copyWith(
                  textScaler: isSmallWidth
                      ? TextScaler.linear(0.85)
                      : TextScaler.linear(1),
                ),
                child: child2,
              ),
            );
          },
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,

          onGenerateTitle: (BuildContext context) => context.t.appTitle,

          themeMode: themeMode,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),

          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar', ''), Locale('en', '')],
        );
      },
    );
  }
}
