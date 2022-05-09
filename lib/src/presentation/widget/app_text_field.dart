import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

import '../config/app_style.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.obscureText = false,
    this.onChanged,
    this.focusNode,
    this.validator,
    this.borderColor = AppColor.colorBlackBlue,
    this.errorColor,
    this.baseColor,
    this.textInputType,
    required this.hint,
    this.controller,
    this.icon,
    this.textInputFormatter,
  }) : super(key: key);
  final String hint;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool? obscureText;
  final Color? baseColor;
  final TextInputType? textInputType;
  final Function? onChanged;
  final ValueChanged<String>? validator;
  final Color borderColor;
  final Color? errorColor;
  final Widget? icon;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom * 4),
        onChanged: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.textInputFormatter,
        obscuringCharacter: '*',
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
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
      ),
    );
  }
}
