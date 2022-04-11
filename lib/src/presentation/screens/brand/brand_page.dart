import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/screens/brand/page_view.dart';
import 'package:healthcare/src/presentation/screens/login_screen.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  final List<BodyPageView> bodyPageView = [
    const BodyPageView(
      picturePath: 'assets/images/image_brand_01.png',
      title: 'We are ready for your health care',
      description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ),
    const BodyPageView(
      picturePath: 'assets/images/image_brand_02.png',
      title: 'Organized teamwork',
      description: 'bbbbbbbbbbbbb',
    ),
    const BodyPageView(
      picturePath: 'assets/images/image_brand_03.png',
      title: 'Ready to take your call',
      description: 'ccccccccccccccccccccc',
    ),
  ];
  final PageController _pageController = PageController();

  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= bodyPageView.length) return 0;
    if (position < 0) return bodyPageView.length - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 620,
                child: PageView(
                  controller: _pageController,
                  children: bodyPageView,
                  onPageChanged: (page) {
                    _updatePosition(page.toDouble());
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: DotsIndicator(
                  dotsCount: bodyPageView.length,
                  mainAxisSize: MainAxisSize.max,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                    activeColor: AppColor.colorBlackBlue,
                    size: const Size.fromRadius(5),
                    activeSize: const Size.fromRadius(7),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: AppStyle().heading4.copyWith(fontSize: 17),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Next',
                        style: AppStyle().heading4.copyWith(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
