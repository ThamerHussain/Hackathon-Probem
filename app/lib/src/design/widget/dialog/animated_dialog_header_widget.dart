import 'package:hackathon/src/design/animation/app_dialog_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedDialogHeaderWidget extends HookWidget {
  const AnimatedDialogHeaderWidget({
    super.key,
    required this.icon,
    required this.backgroundLineColor,
  });

  final Widget icon;
  final Color backgroundLineColor;

  @override
  Widget build(BuildContext context) {
    final animation = useAppDialogAnimation(context);

    useEffect(() {
      animation.controller.forward();
      return null;
    });

    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, _) {
        return SizedBox(
          height: 170,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 64,
                    width: animation.tweens.backgroundLine.value,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: backgroundLineColor,
                    ),
                  ),
                ),
              ),
              RotationTransition(
                turns: animation.tweens.iconRotation2,
                child: RotationTransition(
                  turns: animation.tweens.iconRotation1,
                  child: SizedBox.square(
                    dimension: animation.tweens.iconSize1.value == 20
                        ? animation.tweens.iconSize2.value
                        : animation.tweens.iconSize1.value,
                    child: icon,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
