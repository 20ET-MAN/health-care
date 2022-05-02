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
    NotificationEntity('assets/icon/ic_google.svg', 'titleToday1', 'content'),
    NotificationEntity('assets/icon/ic_google.svg', 'titleToday2', 'content'),
    NotificationEntity('assets/icon/ic_google.svg', 'titleToday3', 'content'),
    NotificationEntity('assets/icon/ic_google.svg', 'titleToday4', 'content'),
  ];

  final List<NotificationEntity> notificationYesterday = [
    NotificationEntity(
        'assets/icon/ic_google.svg', 'titleYesterday1', 'contentToday'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'titleYesterday2', 'contentToday'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'titleYesterday3', 'contentToday'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'titleYesterday4', 'contentToday'),
  ];

  final List<NotificationEntity> notificationOther = [
    NotificationEntity(
        'assets/icon/ic_google.svg', 'notificationOther1', 'contentToday1'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'notificationOther2', 'contentToday2'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'notificationOther3', 'contentToday3'),
    NotificationEntity(
        'assets/icon/ic_google.svg', 'notificationOther4', 'contentToday4'),
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
