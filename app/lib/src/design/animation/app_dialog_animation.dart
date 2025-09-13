import 'package:hackathon/src/core/extension/context_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef AppDialogAnimation = ({
  AnimationController controller,
  ({
    Animation<double> backgroundLine,
    Animation<double> iconSize1,
    Animation<double> iconSize2,
    Animation<double> iconRotation1,
    Animation<double> iconRotation2,
  })
  tweens,
});

AppDialogAnimation useAppDialogAnimation(BuildContext context) {
  final tickerProvider = useSingleTickerProvider();
  final controller = useAnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: tickerProvider,
  );
  final tweens = useMemoized(() {
    return (
      backgroundLine: Tween<double>(begin: 0.0, end: context.width - 40)
          .animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(0.0, 0.5, curve: Curves.easeInExpo),
            ),
          ),
      iconSize1: Tween<double>(begin: 0.0, end: 20.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.2, curve: Curves.ease),
        ),
      ),
      iconSize2: Tween<double>(begin: 20.0, end: 168.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.2, 1.0, curve: Curves.bounceOut),
        ),
      ),
      iconRotation1: Tween<double>(begin: -0.2, end: 0.035).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
        ),
      ),
      iconRotation2: Tween<double>(begin: 0.035, end: -0.033).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.4, 0.6, curve: Curves.easeIn),
        ),
      ),
    );
  });

  return (controller: controller, tweens: tweens);
}
