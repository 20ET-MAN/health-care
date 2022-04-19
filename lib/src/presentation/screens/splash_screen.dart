import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/screens/brand/brand_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BrandPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layoutConstraints) {
          return Center(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: layoutConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icon/ic_caduceus.svg',
                      height: 180,
                      width: 180,
                      color: AppColor.colorBlackBlue,
                      cacheColorFilter: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Health Care',
                      style: AppStyle().heading2.copyWith(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*LayoutBuilder(
builder: (BuildContext context, BoxConstraints layoutConstraints) {
return ConstrainedBox(
constraints: BoxConstraints(minHeight: layoutConstraints.maxHeight),
child: SingleChildScrollView(
child: IntrinsicHeight(
child: SafeArea(
child: isUser
? _itemsUser.elementAt(_selectedIndex)
    : _itemsAdmin.elementAt(_selectedIndex),
),
),
),
);
},
),*/
