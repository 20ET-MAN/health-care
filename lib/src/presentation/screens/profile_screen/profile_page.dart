import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/use_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_item.dart';
import 'package:image_picker/image_picker.dart';

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

class HeaderProfile extends StatefulWidget {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  UserEntity? user;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

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
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: (user.image != '')
                        ? NetworkImage(user.image)
                        : const NetworkImage(
                            'https://static.remove.bg/remove-bg-web/7deb868fb894efaa6d5f6cbfd1a016f4a613fda9/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -25,
                    child: RawMaterialButton(
                      onPressed: () {
                        _showPickOptionsDialog(context);
                      },
                      elevation: 1.0,
                      fillColor: AppColor.colorOrange,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                        color: AppColor.colorWhile,
                      ),
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
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
            user.typeUser == 'admin'
                ? ProfileItem(
                    feature: 'Thống kê dữ liệu',
                    onTap: () {},
                    icon: Icons.create,
                  )
                : const SizedBox(),
            ProfileItem(
                feature: 'Hướng dẫn khám bệnh',
                onTap: () {
                  context.router.push(const HelpCenterRoute());
                },
                icon: Icons.help_outline),
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

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Chọn ảnh từ thư viện'),
              onTap: () {
                imagePickerMethod(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chụp ảnh'),
              onTap: () {
                imagePickerMethod(ImageSource.camera);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future imagePickerMethod(ImageSource source) async {
    final pick = await imagePicker.pickImage(source: source);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        uploadImage(_image!);
      } else {
        EasyLoading.showError('Không có ảnh được chọn');
      }
    });
  }

  Future uploadImage(File _image) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Reference reference = FirebaseStorage.instance
        .ref()
        .child('$currentUserId/images')
        .child('post_$currentUserId');

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();

    final image =
        await firebaseFirestore.collection('Users').doc(currentUserId);

    image.update({
      'images': downloadURL,
    }).whenComplete(
        () => EasyLoading.showSuccess('Cập nhật ảnh đại diện thành công'));
    setState(() {});
  }
}
