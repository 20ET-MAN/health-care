import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class AppNextBt extends StatelessWidget {
  const AppNextBt(
      {Key? key,
      required this.label,
      this.onPressed,
      this.isActive = true,
      this.height = 60})
      : super(key: key);

  final VoidCallback? onPressed;
  final bool? isActive;
  final String label;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isActive!
            ? () {
                onPressed?.call();
              }
            : null,
        child: Text(label,
            style: isActive! ? AppStyle().heading1 : AppStyle().heading2),
        style: ElevatedButton.styleFrom(
          primary: AppColor.colorOrange,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
