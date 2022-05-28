import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:image_picker/image_picker.dart';

class RegisterEnd extends StatefulWidget {
  const RegisterEnd({Key? key}) : super(key: key);

  @override
  State<RegisterEnd> createState() => _RegisterEndState();
}

class _RegisterEndState extends State<RegisterEnd> {
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;
  bool btActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 30),
              Text(
                'Quý khách vui lòng chọn ảnh đại diện để hoàn thành quá trình đăng kí',
                style: AppStyle().heading2,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.colorOrange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 400,
                width: double.infinity,
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        'assets/icon/ic_doctor.png',
                        color: AppColor.colorWhile,
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            color: AppColor.colorOrange,
                            width: 1.0,
                            style: BorderStyle.solid))),
                    onPressed: () {
                      _showPickOptionsDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chọn ảnh',
                          style: AppStyle().heading3,
                        ),
                        const SizedBox(width: 10),
                        const Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(
                              Icons.search_off,
                              color: AppColor.colorOrange,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            color: AppColor.colorOrange,
                            width: 1.0,
                            style: BorderStyle.solid))),
                    onPressed: () {
                      (_image != null)
                          ? uploadImage(_image!)
                          : EasyLoading.showError('Vui lòng chọn ảnh',
                              dismissOnTap: true);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tải ảnh lên',
                          style: AppStyle().heading3,
                        ),
                        const SizedBox(width: 10),
                        const Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(
                              Icons.upload_file,
                              color: AppColor.colorOrange,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              AppNextBt(
                isActive: btActive,
                label: 'Tiếp theo',
                onPressed: () {
                  if (_image != null) {
                    context.router.replace(
                      const LoginPageRoute(),
                    );
                  } else {
                    EasyLoading.showError('Chưa có ảnh được chọn');
                  }
                },
              ),
            ],
          ),
        ),
      ),
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
            ),
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

    final image = firebaseFirestore.collection('Users').doc(currentUserId);

    image.update({
      'images': downloadURL,
    }).whenComplete(() {
      EasyLoading.showSuccess('Tải ảnh lên thành công');
    });
    setState(() {
      btActive = true;
    });
  }
}
