import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  maxRadius: 40,
                  minRadius: 30,
                  backgroundColor: AppColor.colorOrange,
                  child: Icon(
                    Icons.image_outlined,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'nam te ahihi',
                style: AppStyle().heading2,
              ),
              const SizedBox(height: 20),
              ProfileItem(
                feature: 'Thông tin tài khoản',
                onTap: () {},
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Cài đặt',
                onTap: () {
                  AppSettings.openNotificationSettings();
                },
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Quy trình hướng dẫn khám bệnh',
                onTap: () {
                  context.router.push(const HelpCenterRoute());
                },
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Thống kê dữ liệu Covid',
                onTap: () {
                  context.router.push(const CovidDataPageRoute());
                },
                svgSrc: 'assets/icon/ic_google.svg',
              ),
              ProfileItem(
                feature: 'Đăng xuất',
                onTap: () {
                  context.router.replace(const LoginPageRoute());
                },
                svgSrc: 'assets/icon/ic_google.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
