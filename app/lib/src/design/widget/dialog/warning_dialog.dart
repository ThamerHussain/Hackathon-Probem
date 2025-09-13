import 'package:hackathon/localization/strings.g.dart';
import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'app_dialog.dart';

class WarningAppDialogWidget extends StatelessWidget {
  final String? title;
  final String description;
  final String action;
  final String? skip;
  const WarningAppDialogWidget({
    super.key,
    this.title,
    required this.description,
    required this.action,
    this.skip,
  });

  Future<bool?> show(BuildContext context) {
    return showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppDialogWidget(
      backgroundLineColor: Color.fromRGBO(255, 44, 32, 0.15),
      icon: Icon(Icons.warning, color: Color(0xffF3A548), size: 48),
      seedColor: Color(0xffF3A548),
      title: TextSpan(text: title ?? context.t.unexpected_error),
      description: TextSpan(text: description),
      mainButtonTitle: action,
      skipButtonTitle: skip,
    );
  }
}
