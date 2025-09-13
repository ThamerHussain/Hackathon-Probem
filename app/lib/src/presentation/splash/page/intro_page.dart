import 'package:hackathon/src/design/theme/app_palette.dart';
import 'package:hackathon/src/presentation/splash/hooks/use_intro_animations.dart';
import 'package:hackathon/src/presentation/splash/hooks/use_system_ui.dart';
import 'package:hackathon/src/presentation/splash/widget/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IntroPage extends HookWidget {
  const IntroPage({required this.onCompleteAnimation, super.key});
  final VoidCallback onCompleteAnimation;

  @override
  Widget build(BuildContext context) {
    useSystemUIConfiguration();

    final animations = useIntroAnimations();

    return Scaffold(
      backgroundColor: AppPalette.darkGrey,
      body: Stack(
        children: [
          GradientBackground(controller: animations.gradientController),
        ],
      ),
    );
  }
}
