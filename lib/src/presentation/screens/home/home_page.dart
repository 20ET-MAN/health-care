import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/screens/home/home_page_item.dart';
import 'package:healthcare/src/presentation/screens/news_page/news_item.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Có phải bạn đang gặp vấn đề về Covid?',
                        style: AppStyle().heading2.copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Nếu có thì chúng tôi sẽ giúp bạn, vui lòng vào trang cảnh báo hoặc liên hệ cho chúng tôi !',
                        style: AppStyle().heading4,
                      ),
                      const SizedBox(height: 10),
                      IntrinsicHeight(
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: AppNextBt(
                                  label: 'Liên hệ ngay',
                                  onPressed: () async {
                                    final Uri launchUri = Uri(
                                      scheme: 'tel',
                                      path: '0362557072',
                                    );
                                    await launchUrl(launchUri);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: AppNextBt(
                                  label: 'Gửi thông báo',
                                  color: AppColor.colorBlackBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Service',
                  style: AppStyle().heading2.copyWith(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 380,
                child: HomePageGridItem(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'News',
                  style: AppStyle().heading2.copyWith(fontSize: 22),
                ),
              ),
              SizedBox(
                //color: AppColor.colorBlackBlue,
                height: 660,
                child: NewsItem(),
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 3,
                color: AppColor.colorGrey,
              ),
              const SizedBox(height: 20),
              Text(
                'Lorem Ipsum',
                style: AppStyle().heading2,
              ),
              const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
              Text(
                'Where can I get some?',
                style: AppStyle().heading2,
              ),
              const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceItemModel {
  final String title;
  final String label;
  final String iconSrc;
  final PageRouteInfo screen;

  ServiceItemModel(this.title, this.label, this.iconSrc, this.screen);
}
