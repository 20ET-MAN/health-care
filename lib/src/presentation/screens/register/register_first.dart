import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:intl/intl.dart';

import '../../config/app_style.dart';
import '../../controller/auth_service_controller.dart';
import '../../controller/use_controller.dart';
import '../../controller/validator_controller.dart';
import '../../widget/app_next_bt.dart';
import '../../widget/app_text_field.dart';

class RegisterFirst extends StatefulWidget {
  const RegisterFirst({Key? key}) : super(key: key);

  @override
  State<RegisterFirst> createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
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

  final List<String> sexItems = [
    'Nam',
    'Nữ',
  ];
  String? selectedSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: GestureDetector(
        onTap: () {
          unFocus();
        },
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Sign Up',
                        style: AppStyle().heading2.copyWith(fontSize: 30),
                      ),
                      const SizedBox(height: 70),
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
                        textCapitalization: TextCapitalization.words,
                        textInputType: TextInputType.emailAddress,
                        focusNode: _focusNodeEmail,
                        hint: 'Your email or phone',
                        controller: eMail,
                        textInputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[/\á-úÁ-Ú|+{}*%^&$#_ ]')),
                        ],
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
                        hint: 'Họ và tên',
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
                                suffixIcon:
                                    const Icon(Icons.calendar_today_outlined),
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor: AppColor.colorWhile,
                                hintText: "Ngày sinh",
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
                            'Phone',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hint: 'Số điện thoại',
                        textInputType: TextInputType.phone,
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                        hint: 'Tên tài khoản',
                        controller: userName,
                        focusNode: _focusNodeUserName,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Sex',
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
                      const SizedBox(height: 20),
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
                        hint: 'Mật khẩu',
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
                        hint: 'Xác nhận mật khẩu',
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
                          if ((selectedSex ?? '').isEmpty) {
                            EasyLoading.showError(
                                'Giới tính là trường bắt buộc');
                          } else {
                            createUser();
                          }
                        },
                        label: 'Sign Up',
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Already have an Account? ',
                                style: AppStyle().heading4),
                            GestureDetector(
                              onTap: () {
                                context.router.push(const LoginPageRoute());
                              },
                              child: Text('Login', style: AppStyle().heading3),
                            ),
                          ],
                        ),
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

  Future<void> createUser() async {
    if (fullName.text.length < 8 || fullName.text.length > 32) {
      EasyLoading.showError('Họ Tên tài khoản phải có 8 -32 kí tự');
    } else if (userName.text.length < 4 || userName.text.length > 32) {
      EasyLoading.showError('Tên tài khoản phải có 4 -32 kí tự');
    } else if (dateOFBirth.text.isEmpty) {
      EasyLoading.showError('Vui lòng chọn ngày sinh');
    } else if (phone.text.trim().length < 10 || phone.text.length > 10) {
      EasyLoading.showError('Số điện thoại không đúng định dạng');
    } else {
      final user = await AuthServiceController.registerUsingEmailPassword(
          email: eMail.text.trim(),
          password: passWord.text.trim(),
          confirmPassword: confirmPassWord.text);
      if (user != null) {
        UserController().userSetup(
            userName: userName.text,
            sex: selectedSex ?? 'nam',
            dateOfBirth: dateOFBirth.text,
            typeUser: 'user',
            fullName: fullName.text,
            creationDate: DateTime.now().toString(),
            phoneNumber: phone.text.trim(),
            userStatus: 0,
            images: '',
            uId: FirebaseAuth.instance.currentUser!.uid);
        EasyLoading.showSuccess('Đăng kí thành công',
            maskType: EasyLoadingMaskType.custom);
        context.router.replace(const RegisterEndRoute());
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
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
}
