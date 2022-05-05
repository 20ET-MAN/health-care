import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class BodyPageView extends StatelessWidget {
  const BodyPageView({
    Key? key,
    required this.picturePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String picturePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          picturePath,
          height: 350,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Text(
            title,
            style: AppStyle().heading2.copyWith(fontSize: 17),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Text(
            description,
            style: AppStyle().heading4,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
