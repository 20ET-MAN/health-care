import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

import '../../config/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.colorWhile,
        title: Text(
          'Profile',
          style: AppStyle().heading2.copyWith(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              maxRadius: 35,
              minRadius: 25,
              backgroundColor: AppColor.colorOrange,
              child: Text('AH'),
            ),
            const SizedBox(height: 20),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'My Account',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Setting',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Help center',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'My Account',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'My Account',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
            Container(
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
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Logout',
                      style: AppStyle().heading2,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColor.colorBlackBlue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
