import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, this.userEntity}) : super(key: key);
  final UserEntity? userEntity;

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
                  radius: 100,
                  backgroundColor: AppColor.colorOrange,
                  backgroundImage: NetworkImage(
                    'https://trainghiemsong.vn/wp-content/uploads/2021/03/1-625.jpg',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '',
                style: AppStyle().heading2,
              ),
              const SizedBox(height: 20),
              ProfileItem(
                feature: 'Thông tin tài khoản',
                onTap: () {},
                icon: Icons.info_outline,
              ),
              ProfileItem(
                feature: 'Cài đặt',
                onTap: () {
                  AppSettings.openNotificationSettings();
                },
                icon: Icons.settings,
              ),
              ProfileItem(
                  feature: 'Quy trình hướng dẫn khám bệnh',
                  onTap: () {
                    context.router.push(const HelpCenterRoute());
                  },
                  icon: Icons.help_outline),
              ProfileItem(
                feature: 'Thống kê dữ liệu Covid',
                onTap: () {
                  context.router.push(const CovidDataPageRoute());
                },
                icon: Icons.list_alt_outlined,
              ),
              ProfileItem(
                feature: 'Đăng xuất',
                onTap: () {
                  EasyLoading.show(
                    status: '...',
                  );
                  FirebaseAuth.instance.signOut();
                  EasyLoading.showSuccess('Đăng xuất thành công',
                      maskType: EasyLoadingMaskType.custom);
                  context.router.replace(const LoginPageRoute());
                },
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
