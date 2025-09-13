import 'package:hackathon/localization/strings.g.dart';
import 'package:hackathon/src/core/app.dart';
import 'package:hackathon/src/core/setup/talker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: ProviderScope(observers: [mainTalker], child: App()),
    ),
  );
}
