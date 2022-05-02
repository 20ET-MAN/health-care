import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare/src/domain/entities/notification_entity.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class NotificationOther extends StatelessWidget {
  const NotificationOther({Key? key, required this.item}) : super(key: key);

  final List<NotificationEntity> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.colorWhile,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.colorOrange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SvgPicture.asset(item[index].assetName),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item[index].title,
                      style: AppStyle().heading2,
                    ),
                    Text(item[index].content),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
