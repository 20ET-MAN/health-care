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
                      SizedBox(
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
              const SizedBox(
                  //color: AppColor.colorBlackBlue,
                  height: 700,
                  child: Center(child: NewsItem()) //NewsItem(),
                  ),
              const SizedBox(height: 20),
              const Divider(
                height: 3,
                color: AppColor.colorGrey,
              ),
              const SizedBox(height: 20),
              const BottomTextInfo(
                  icon: Icons.lock_clock,
                  title: 'THỜI GIAN LÀM VIỆC',
                  label:
                      'Thời gian làm việc tất cả các ngày trong tuần(Ngày lễ, Thứ 7 và Chủ nhật)'),
              const BottomTextInfo(
                  icon: Icons.location_on_outlined,
                  title: 'Địa chỉ',
                  label:
                      'Số 2 Bế Văn Đàn, Phường Quang Trung, Quận Hà Đông, Thành Phố Hà Nội'),
              const BottomTextInfo(
                  icon: Icons.phone,
                  title: 'Số điện thoại',
                  label: '0915 580 644 - 0969 668 115'),
              const BottomTextInfo(
                  icon: Icons.mail_outline,
                  title: 'Email',
                  label: 'benhviendkhadong@gmail.com'),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTextInfo extends StatelessWidget {
  const BottomTextInfo(
      {Key? key, required this.title, required this.label, required this.icon})
      : super(key: key);
  final String title;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColor.colorOrange,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyle().heading2,
              ),
              const SizedBox(height: 5),
              Text(label, style: AppStyle().heading4),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
