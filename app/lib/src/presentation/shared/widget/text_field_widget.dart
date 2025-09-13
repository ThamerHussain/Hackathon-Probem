import 'package:hackathon/src/design/theme/app_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
  });
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.appSpace.xs4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}

class PasswordTextField extends HookWidget {
  const PasswordTextField({super.key, this.label, this.hint, this.controller});
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final isObscure = useState(true);
    return TextFieldWidget(
      controller: controller,
      label: label,
      hint: hint,
      suffixIcon: IconButton(
        onPressed: () {
          isObscure.value = !isObscure.value;
        },
        icon: Icon(isObscure.value ? Icons.visibility_off : Icons.visibility),
      ),
      obscureText: isObscure.value,
    );
  }
}
