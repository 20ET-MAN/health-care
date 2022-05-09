import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

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
                        hint: 'Full name',
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
                            'Phone',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hint: 'Phone',
                        textInputType: TextInputType.phone,
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
                        hint: 'User name',
                        controller: userName,
                        focusNode: _focusNodeUserName,
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
                              RegExp(r'[/\\á-ú Á-Ú|]')),
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
                              RegExp(r'[/\\á-ú Á-Ú|]')),
                        ],
                        validator: (value) =>
                            Validator.validatePassword(password: value),
                      ),
                      const SizedBox(height: 30),
                      AppNextBt(
                        onPressed: () async {
                          createUser();
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
      if (user != null) {
        userSetup(
            userName: userName.text,
            dateOfBirth: dateOFBirth.text,
            typeUser: 'admin',
            fullName: fullName.text,
            creationDate: DateTime.now().toString(),
            phoneNumber: phone.text);
        EasyLoading.showSuccess('Đăng kí thành công',
            maskType: EasyLoadingMaskType.custom);
        context.router.replace(const LoginPageRoute());
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2200));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          String convertedDateTime =
              "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
          dateOFBirth.value = TextEditingValue(text: convertedDateTime);
        },
      );
    }
  }
}
