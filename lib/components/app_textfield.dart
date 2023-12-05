import 'package:flutter/material.dart';
import 'package:whollet_flutter_app/components/app_image.dart';
import 'package:whollet_flutter_app/resources/icons.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;

  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

class SecureTextField extends AppTextField {
  SecureTextField({
    super.key,
    required super.controller,
    super.hintText,
    super.labelText,
  });

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _isPasswordVisible,
      builder: (context, child) {
        return TextFormField(
          controller: controller,
          obscureText: _isPasswordVisible.value,
          obscuringCharacter: "•",
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () => _isPasswordVisible.value = !_isPasswordVisible.value,
              icon: SvgImageFromAsset.square(
                _isPasswordVisible.value ? BaseAppIcons.eyeShow : BaseAppIcons.eyeHide,
                size: 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
