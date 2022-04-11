import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_color.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.color = AppColor.colorOrange,
    required this.src,
    this.heightSrc,
    this.widthSrc,
    this.style,
    this.spaceWidth = 15,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;
  final String src;
  final double? heightSrc;
  final double? widthSrc;
  final Color color;
  final TextStyle? style;
  final double? spaceWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: spaceWidth),
            SvgPicture.asset(
              src,
              height: heightSrc,
              width: widthSrc,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
