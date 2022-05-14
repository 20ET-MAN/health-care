import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/use_controller.dart';
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
            children: [
              const HeaderProfile(),
              ProfileItem(
                feature: 'Cài đặt',
                onTap: () {
                  AppSettings.openNotificationSettings();
                },
                icon: Icons.settings,
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
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserEntity>(
      future: UserController().getCurrentUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
              height: 200, child: Center(child: CircularProgressIndicator()));
        }
        final UserEntity user = snapshot.data!;
        return Column(
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
                  'https://i.pinimg.com/originals/c3/01/81/c30181f2d8e826582394d6d36e2dfc30.jpg',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.fullName,
              style: AppStyle().heading2,
            ),
            const SizedBox(height: 20),
            ProfileItem(
              feature: 'Thông tin tài khoản',
              onTap: () {
                context.router.push(UserProfileInfoRoute(user: user));
              },
              icon: Icons.info_outline,
            ),
            user.typeUser == 'admin'
                ? ProfileItem(
                    feature: 'Tạo tài khoản',
                    onTap: () {
                      context.router.push(const CreateUserPageRoute());
                    },
                    icon: Icons.create,
                  )
                : const SizedBox(),
            ProfileItem(
                feature: 'Hướng dẫn khám bệnh',
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
            user.typeUser == 'user'
                ? ProfileItem(
                    feature: 'Lịch sử khám của tôi',
                    onTap: () {
                      context.router.push(const BookingListUserRoute());
                    },
                    icon: Icons.history,
                  )
                : const SizedBox(),
            user.typeUser == 'admin'
                ? ProfileItem(
                    feature: 'Thêm bác sĩ',
                    onTap: () {
                      context.router.push(const CreateDoctorRoute());
                    },
                    icon: Icons.add,
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
