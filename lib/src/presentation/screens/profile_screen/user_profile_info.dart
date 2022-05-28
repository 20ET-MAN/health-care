import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key, required this.user}) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Thông tin cá nhân'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: user.image != ''
                      ? DecorationImage(
                          image: NetworkImage(
                            user.image,
                          ),
                          fit: BoxFit.cover)
                      : const DecorationImage(
                          image: AssetImage('assets/icon/ic_doctor.png')),
                ),
              ),
              const SizedBox(height: 10),
              TextCommon(label: 'Tên Người dùng: ', content: user.userName),
              TextCommon(label: 'Họ tên: ', content: user.fullName),
              TextCommon(label: 'Số điện thoại: ', content: user.phoneNumber),
              TextCommon(label: 'Ngày sinh: ', content: user.dateOfBirth),
              TextCommon(
                  label: 'Ngày tạo tài khoản: ', content: user.creationDate),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCommon extends StatelessWidget {
  const TextCommon({Key? key, required this.label, required this.content})
      : super(key: key);
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppStyle().heading4),
        Expanded(
          child: Text(
            content,
            style: AppStyle().heading4.copyWith(color: AppColor.colorOrange),
          ),
        ),
      ],
    );
  }
}
