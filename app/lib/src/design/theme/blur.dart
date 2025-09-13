import 'package:hackathon/src/core/extension/context_extension.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      Blur(blur: 20, blurColor: context.customTheme.white15, child: child);
}

class LayerBlurVertical extends StatelessWidget {
  const LayerBlurVertical({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      Blur(blur: 500, blurColor: context.customTheme.white15, child: child);
}

class LayerBlurHorizontal extends StatelessWidget {
  const LayerBlurHorizontal({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      Blur(blur: 200, blurColor: context.customTheme.white15, child: child);
}
