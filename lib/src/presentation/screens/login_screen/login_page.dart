import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/app_icon_bt.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:healthcare/src/presentation/widget/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

@override
class _LoginPageState extends State<LoginPage> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'HealthCare',
                    style: AppStyle().heading2.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 70),
                  AppIconButton(
                    onTap: () {},
                    label: 'Log in with Google',
                    src: 'assets/icon/ic_google.svg',
                    color: AppColor.colorWhile,
                    heightSrc: 30,
                    widthSrc: 30,
                    style: AppStyle().heading2,
                  ),
                  const SizedBox(height: 20),
                  AppIconButton(
                    onTap: () {},
                    label: 'Log in with Facebook',
                    src: 'assets/icon/ic_facebook.svg',
                    color: AppColor.colorBlackBlue,
                    heightSrc: 30,
                    //spaceWidth: 40,
                    widthSrc: 30,
                    style: AppStyle().heading1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'OR',
                    style: AppStyle().heading2.copyWith(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        'Email',
                        style: AppStyle().heading2.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AppTextField(hint: 'Your email or phone'),
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
                    textInputFormatter: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'[/\\á-ú Á-Ú|]')),
                    ],
                    hint: 'Password',
                    obscureText: _obscured,
                    icon: GestureDetector(
                      onTap: () {
                        _toggleObscured();
                      },
                      child: Icon(
                        _obscured
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppNextBt(
                    onPressed: () {
                      context.router.replace(const HomeScreenRoute());
                    },
                    label: 'Login',
                    isActive: true,
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    child: Text(
                      'Forgot password ?',
                      style: AppStyle().heading4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Don\'t have any account ?',
                            style: AppStyle().heading4),
                        GestureDetector(
                          onTap: () {
                            context.router.push(RegisterFirstRoute());
                          },
                          child: Text('Sign up', style: AppStyle().heading3),
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
    );
  }
}
