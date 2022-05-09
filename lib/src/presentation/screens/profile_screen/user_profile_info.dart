import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key, required this.user}) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(),
      body: Column(
        children: [
          Text(user.fullName),
          Text(user.fullName.toString()),
          Text(user.userName.toString()),
          Text(user.phoneNumber.toString()),
          Text(user.dateOfBirth.toString()),
        ],
      ),
    );
  }
}
