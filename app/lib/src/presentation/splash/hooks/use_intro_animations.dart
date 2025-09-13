import 'package:hackathon/src/design/theme/app_palette.dart';
import 'package:hackathon/src/presentation/splash/widget/splash_animation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IntroAnimations {
  final Animation<double> logoFade;
  final Animation<double> logoScale;
  final Animation<Color?> logoColor;
  final Animation<double> textFade;
  final Animation<Offset> textSlide;

  final AnimationController logoController;
  final AnimationController logoColorController;
  final AnimationController gradientController;
  final AnimationController textController;

  IntroAnimations({
    required this.logoFade,
    required this.logoScale,
    required this.logoColor,
    required this.textFade,
    required this.textSlide,
    required this.logoController,
    required this.logoColorController,
    required this.gradientController,
    required this.textController,
  });
}

IntroAnimations useIntroAnimations() {
  final logoController = useAnimationController(
    duration: SplashAnimationDurations.logoFadeScale,
  );

  final gradientController = useAnimationController(
    duration: SplashAnimationDurations.gradient,
  );

  final textController = useAnimationController(
    duration: SplashAnimationDurations.text,
  );

  final logoColorController = useAnimationController(
    duration: SplashAnimationDurations.logoColor,
  );

  final logoFade = useMemoized(
    () => Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeOutCubic),
    ),
    [logoController],
  );

  final logoScale = useMemoized(
    () => Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.elasticOut),
    ),
    [logoController],
  );

  final logoColor = useMemoized(
    () => ColorTween(begin: Colors.white, end: AppPalette.primary).animate(
      CurvedAnimation(parent: logoColorController, curve: Curves.easeInOut),
    ),
    [logoColorController],
  );

  final textFade = useMemoized(
    () => Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: textController, curve: Curves.easeIn)),
    [textController],
  );

  final textSlide = useMemoized(
    () => Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: textController, curve: Curves.easeOutCubic),
    ),
    [textController],
  );

  return IntroAnimations(
    logoFade: logoFade,
    logoScale: logoScale,
    logoColor: logoColor,
    textFade: textFade,
    textSlide: textSlide,
    logoController: logoController,
    logoColorController: logoColorController,
    gradientController: gradientController,
    textController: textController,
  );
}

void useAnimationSequence({
  required AnimationController logoController,
  required AnimationController logoColorController,
  required AnimationController gradientController,
  required AnimationController textController,
  required VoidCallback onComplete,
}) {
  useEffect(() {
    bool isMounted = true;

    Future<void> runSequence() async {
      if (!isMounted) return;

      // Logo fade and scale
      await logoController.forward();

      // Logo color change
      await Future.delayed(SplashAnimationDelays.beforeColorChange);
      if (!isMounted) return;
      await logoColorController.forward();

      // Gradient fade
      await Future.delayed(SplashAnimationDelays.afterColorChange);
      if (!isMounted) return;
      await gradientController.forward();

      // Text animations
      await Future.delayed(SplashAnimationDelays.beforeText);
      if (!isMounted) return;
      await textController.forward();

      await Future.delayed(SplashAnimationDelays.beforeComplete);
      if (!isMounted) return;
      onComplete();
    }

    runSequence();

    return () {
      isMounted = false;
    };
  }, []);
}
