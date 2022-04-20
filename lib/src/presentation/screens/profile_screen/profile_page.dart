import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_item.dart';

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
      body: SingleChildScrollView(
        child: Container(
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
              ProfileItem(
                feature: 'My Account',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Setting',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Help Center',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Logout',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Logout',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Logout',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Logout',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
