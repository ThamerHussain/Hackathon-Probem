import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

typedef AppSpace = ({
  double xs5,
  double xs4,
  double xs3,
  double xs2,
  double xs,
  double s,
  double m,
  double l,
  double xl,
  double xll,
});

extension AppSpaceExtension on BuildContext {
  AppSpace get appSpace => (
    xs5: 2,
    xs4: 4,
    xs3: 8,
    xs2: 12,
    xs: 16,
    s: 20,
    m: 32,
    l: 40,
    xl: 44,
    xll: 52,
  );
}

extension AppSpaceDoubleExtension on double {
  EdgeInsets toAllEdgeInsets() => EdgeInsets.all(this);
  EdgeInsets toHorizontalEdgeInsets() => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets toVerticalEdgeInsets() => EdgeInsets.symmetric(vertical: this);

  Gap get gap => Gap(this);

  SliverGap get sliverGap => SliverGap(this);
}
