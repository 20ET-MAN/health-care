import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/screens/login_screen/login_screen.dart';

import '../../config/app_style.dart';
import '../../widget/app_next_bt.dart';
import '../../widget/app_text_field.dart';
import '../brand/brand_page.dart';

class RegisterFirst extends StatelessWidget {
  const RegisterFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
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
                  const AppTextField(hint: 'Your email or phone'),
                  Row(
                    children: [
                      Text(
                        'User name',
                        style: AppStyle().heading2.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AppTextField(hint: 'User name'),
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
                  const AppTextField(
                    hint: 'Password',
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
                  const AppTextField(
                    hint: 'Confirm Password',
                  ),
                  const SizedBox(height: 30),
                  AppNextBt(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const BrandPage();
                        }),
                      );
                    },
                    label: 'Sign Up',
                    isActive: true,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }),
                            );
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
    );
  }
}
