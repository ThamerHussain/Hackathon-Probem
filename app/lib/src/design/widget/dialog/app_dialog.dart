import 'package:hackathon/src/design/theme/theme.dart';
import 'package:hackathon/src/design/widget/button.dart';
import 'package:flutter/material.dart';

import 'animated_dialog_header_widget.dart';

class AppDialogWidget extends StatelessWidget {
  const AppDialogWidget({
    super.key,
    required this.backgroundLineColor,
    required this.icon,
    required this.title,
    required this.seedColor,
    required this.description,
    required this.mainButtonTitle,
    this.skipButtonTitle,
    this.popable = true,
  });

  final Color backgroundLineColor;
  final Widget icon;
  final Color seedColor;
  final TextSpan title;
  final TextSpan description;
  final String mainButtonTitle;
  final String? skipButtonTitle;
  final bool popable;

  Future<void> show(BuildContext context) => showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) => this,
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: popable,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.appSpace.xs3),
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffffffff),
            child: Padding(
              padding: EdgeInsets.all(context.appSpace.xs),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDialogHeaderWidget(
                    backgroundLineColor: backgroundLineColor,
                    icon: icon,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: context.appSpace.s),
                    child: Column(
                      spacing: context.appSpace.xs3,
                      children: [
                        Text.rich(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: seedColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text.rich(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff546378),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    spacing: context.appSpace.xs3,
                    children: [
                      LoadingButton.text(
                        style: FilledButton.styleFrom(
                          backgroundColor: seedColor,
                        ),
                        label: mainButtonTitle,
                        textColor: Colors.white,
                        onPressed: () async => Navigator.pop(context, true),
                      ),
                      if (skipButtonTitle != null)
                        LoadingButton.text(
                          style: FilledButton.styleFrom(
                            backgroundColor: seedColor,
                          ),
                          label: skipButtonTitle!,
                          textColor: Colors.white,
                          onPressed: () async => Navigator.pop(context, false),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
