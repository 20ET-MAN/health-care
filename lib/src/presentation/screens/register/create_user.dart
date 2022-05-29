import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../controller/auth_service_controller.dart';
import '../../controller/use_controller.dart';
import '../../controller/validator_controller.dart';
import '../../widget/app_next_bt.dart';
import '../../widget/app_text_field.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final TextEditingController eMail = TextEditingController();

  final TextEditingController userName = TextEditingController();

  final TextEditingController passWord = TextEditingController();

  final TextEditingController confirmPassWord = TextEditingController();

  final TextEditingController fullName = TextEditingController();

  final TextEditingController dateOFBirth = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final FocusNode _focusNodeEmail = FocusNode();

  final FocusNode _phone = FocusNode();

  final FocusNode _focusNodeUserName = FocusNode();

  final FocusNode _focusNodePassWord = FocusNode();

  final FocusNode _focusNodeConfirmPassWord = FocusNode();

  final FocusNode _fullName = FocusNode();

  final FocusNode _dateOfBirth = FocusNode();

  final GlobalKey _globalKey = GlobalKey();

  DateTime selectedDate = DateTime.now();

  final List<String> userItems = [
    'user',
    'admin',
  ];
  final List<String> sexItems = [
    'Nam',
    'Nữ',
  ];
  String? selectedTypeUser;
  String? selectedSex;
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Tạo tài khoản'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          unFocus();
        },
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        textInputType: TextInputType.emailAddress,
                        focusNode: _focusNodeEmail,
                        hint: 'Your email or phone',
                        controller: eMail,
                        validator: (value) =>
                            Validator.validateEmail(email: value),
                      ),
                      Row(
                        children: [
                          Text(
                            'Full name',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        textCapitalization: TextCapitalization.words,
                        hint: 'Full name',
                        textInputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[0-9|{}()?><@#$%^&]')),
                        ],
                        controller: fullName,
                        focusNode: _fullName,
                      ),
                      Row(
                        children: [
                          Text(
                            'Date of Birth',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.colorWhile,
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom *
                                          4),
                              controller: dateOFBirth,
                              focusNode: _dateOfBirth,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColor.colorOrange,
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor: AppColor.colorWhile,
                                hintText: "Date of birth",
                                hintStyle: AppStyle()
                                    .heading4
                                    .copyWith(color: AppColor.colorGrey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              //style: AppStyle().heading4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Giới tính',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.colorWhile,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Giới tính',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.colorOrange,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: sexItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedSex = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Phone',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hint: 'Phone',
                        textInputType: TextInputType.phone,
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                        ],
                        controller: phone,
                        focusNode: _phone,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'User name',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        textCapitalization: TextCapitalization.words,
                        hint: 'User name',
                        controller: userName,
                        focusNode: _focusNodeUserName,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Loại tài khoản',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.colorWhile,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Loại tài khoản',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.colorOrange,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: userItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedTypeUser = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Password',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        focusNode: _focusNodePassWord,
                        hint: 'Password',
                        obscureText: true,
                        controller: passWord,
                        textInputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\á-ú Á-Ú| ]')),
                        ],
                        validator: (value) =>
                            Validator.validatePassword(password: value),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Confirm Password',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hint: 'Confirm Password',
                        controller: confirmPassWord,
                        obscureText: true,
                        focusNode: _focusNodeConfirmPassWord,
                        textInputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\á-ú Á-Ú| ]')),
                        ],
                        validator: (value) =>
                            Validator.validatePassword(password: value),
                      ),
                      const SizedBox(height: 30),
                      AppNextBt(
                        onPressed: () async {
                          if ((selectedTypeUser ?? '').isEmpty) {
                            EasyLoading.showError(
                                'Loại tài khoản là trường bắt buộc');
                          } else if ((selectedSex ?? '').isEmpty) {
                            EasyLoading.showError(
                                'Giới tính là trường bắt buộc');
                          } else if (_image == null) {
                            EasyLoading.showError('Vui lòng chọn ảnh');
                          } else {
                            createUser(_image!);
                          }
                        },
                        label: 'Thêm tài khoản',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void unFocus() {
    _focusNodePassWord.unfocus();
    _focusNodeEmail.unfocus();
    _focusNodeConfirmPassWord.unfocus();
    _focusNodeUserName.unfocus();
    _fullName.unfocus();
    _dateOfBirth.unfocus();
    _phone.unfocus();
  }

  Future<void> createUser(File _image) async {
    if (fullName.text.length < 8 || fullName.text.length > 32) {
      EasyLoading.showError('Họ Tên tài khoản phải có 8 -32 kí tự');
    } else if (userName.text.length < 6 || userName.text.length > 32) {
      EasyLoading.showError('Tên tài khoản phải có 4 -32 kí tự');
    } else if (dateOFBirth.text.isEmpty) {
      EasyLoading.showError('Vui lòng chọn ngày sinh');
    } else if (phone.text.length < 10 || phone.text.length > 10) {
      EasyLoading.showError('Số điện thoại không đúng định dạng');
    } else {
      final user = await AuthServiceController.registerUsingEmailPassword(
          email: eMail.text,
          password: passWord.text,
          confirmPassword: confirmPassWord.text);

      Reference reference = FirebaseStorage.instance
          .ref()
          .child('$currentUserId/images')
          .child('post_$currentUserId');
      await reference.putFile(_image);
      downloadURL = await reference.getDownloadURL();
      if (user != null) {
        UserController().userSetup(
            userName: userName.text,
            sex: selectedSex ?? 'nam',
            dateOfBirth: dateOFBirth.text,
            typeUser: selectedTypeUser ?? 'user',
            fullName: fullName.text.toUpperCase(),
            images: downloadURL ?? '',
            creationDate: DateFormat.yMd().format(DateTime.now()),
            phoneNumber: phone.text,
            uId: FirebaseAuth.instance.currentUser!.uid,
            userStatus: 0);
        setState(() {});
        EasyLoading.showSuccess('Thêm thành công',
            maskType: EasyLoadingMaskType.custom);
        context.router.pop();
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          String convertedDateTime = DateFormat.yMd().format(selectedDate);
          dateOFBirth.value = TextEditingValue(text: convertedDateTime);
        },
      );
    }
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

  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
}
