import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

import '../config/app_style.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.borderColor = AppColor.colorBlackBlue,
    this.errorColor,
    this.baseColor,
    required this.hint,
    this.controller,
    this.icon,
  }) : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final bool? obscureText;
  final Color? baseColor;
  final Function? onChanged;
  final Function? validator;
  final Color borderColor;
  final Color? errorColor;
  final Icon? icon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    // currentColor = widget?.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 4),
      controller: widget.controller,
      obscureText: widget.obscureText!, //show and disable pass
      decoration: InputDecoration(
        suffixIcon: widget.icon,
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: AppColor.colorWhile,
        hintText: widget.hint,
        hintStyle: AppStyle().heading4.copyWith(color: AppColor.colorGrey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
