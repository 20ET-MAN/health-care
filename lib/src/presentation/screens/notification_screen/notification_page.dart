import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/notification_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/screens/notification_screen/notification_other.dart';
import 'package:healthcare/src/presentation/screens/notification_screen/notification_today.dart';
import 'package:healthcare/src/presentation/screens/notification_screen/notification_yesterday.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  final List<NotificationEntity> notificationToday = [
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Dịch vụ khám bệnh công nghệ mới',
        'Bệnh viện đa khoa a với truyền thống lâu đời'),
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Chào mừng kỉ niệm thành lập',
        'Bệnh viện đa khoa a với tđờiền thống lâu đời'),
  ];

  final List<NotificationEntity> notificationYesterday = [
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Chào mừng kỉ niệm thành lập ',
        'Bệnh viện đa khoa a với truyền thống lâu đời'),
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Dịch vụ khám bệnh thiện nguyện',
        'Áp dụng dịch vụ khám bệnh dựa trên công nghệ mới '),
  ];

  final List<NotificationEntity> notificationOther = [
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Thủ tục khám bệnh kiểu mới',
        'Bệnh viện thông báo hìnhmớiức khám bệnh mới'),
    NotificationEntity(
        'assets/icon/ic_google.svg',
        'Thông báo tình hình dịch covid 2022',
        'Tình hình dịch bệnh đã cơ bản được kiểm soát'),
  ];

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  NotificationToday(item: widget.notificationToday),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yesterday',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  NotificationYesterday(item: widget.notificationYesterday),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Other',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  NotificationOther(item: widget.notificationOther),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
