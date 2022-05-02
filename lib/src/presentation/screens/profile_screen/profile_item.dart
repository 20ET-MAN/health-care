import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.svgSrc,
    required this.feature,
    required this.onTap,
  }) : super(key: key);

  final String svgSrc;
  final String feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.colorWhile,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColor.colorOrange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(svgSrc),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                feature,
                style: AppStyle().heading2,
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: AppColor.colorBlackBlue,
            ),
          ],
        ),
      ),
    );
  }
}
