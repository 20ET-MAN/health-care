import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/style_config.dart';

class AppStyle {
  TextStyle heading1 = const TextStyle(
    color: AppColor.colorWhile,
    letterSpacing: 1.2,
    fontSize: 15,
    fontFamily: StyleConfig.sfProFont,
    fontWeight: FontWeight.w700,
    wordSpacing: 24 / 20,
  );
  TextStyle heading2 = const TextStyle(
    color: AppColor.colorBlackBlue,
    letterSpacing: 1.2,
    fontSize: 15,
    fontFamily: StyleConfig.sfProFont,
    fontWeight: FontWeight.w700,
    wordSpacing: 24 / 20,
  );
  TextStyle heading3 = const TextStyle(
    color: AppColor.colorOrange,
    fontSize: 15,
    fontFamily: StyleConfig.sfProFont,
    fontWeight: FontWeight.w500,
    wordSpacing: 24 / 16,
  );
  TextStyle heading4 = const TextStyle(
    color: AppColor.colorBlackBlue,
    fontSize: 15,
    fontFamily: StyleConfig.sfProFont,
    fontWeight: FontWeight.w500,
    wordSpacing: 24 / 16,
  );
  TextStyle heading5 = const TextStyle(
    color: AppColor.colorWhile,
    fontSize: 15,
    fontFamily: StyleConfig.sfProFont,
    fontWeight: FontWeight.w500,
    wordSpacing: 24 / 16,
  );
}
