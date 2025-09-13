import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

({
  AnimationController animation1,
  AnimationController animation2,
  AnimationController animation3,
})
useSplashAnimation() {
  final animation1 = useAnimationController();
  final animation2 = useAnimationController();
  final animation3 = useAnimationController();

  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Future.delayed(Duration(milliseconds: 50));
        await animation1.animateTo(1, duration: Duration(milliseconds: 200));
        await Future.delayed(Duration(milliseconds: 100));
        await animation2.animateTo(
          1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
        await Future.delayed(Duration(milliseconds: 1));
        await animation3.animateTo(
          1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      } catch (e) {
        //
      }
    });
    return null;
  }, []);

  return (
    animation1: animation1,
    animation2: animation2,
    animation3: animation3,
  );
}
