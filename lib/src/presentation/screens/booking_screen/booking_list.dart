import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../../domain/entities/booking_list.dart';

class BookingListAdmin extends StatefulWidget {
  BookingListAdmin({Key? key}) : super(key: key);

  final List<BookingListEntity> itemBookingList = [
    BookingListEntity(
        type: 'Khám Tổng quát',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'Waiting',
        sex: 'Male',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Test Covid',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'Waiting',
        sex: 'Other',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Khám tim mạch',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'approve',
        sex: 'Male',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Khám phụ khoa',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'Waiting',
        sex: 'FeMale',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Khám nam khoa',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'approve',
        sex: 'Male',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Khám hệ tiêu hoá',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'Waiting',
        sex: 'Other',
        description: 'Khám tổng quát hậu Covid'),
    BookingListEntity(
        type: 'Khám xuơng khớp',
        name: 'Ngô Tiến Nam',
        doctor: 'Doctor Strange',
        date: DateTime.now().toString(),
        status: 'approve',
        sex: 'Male',
        description: 'Khám tổng quát hậu Covid'),
  ];

  @override
  State<BookingListAdmin> createState() => _BookingListAdminState();
}

class _BookingListAdminState extends State<BookingListAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: ListView.builder(
        itemCount: widget.itemBookingList.length,
        //physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.router.push(
                BookingListDetailAdminRoute(
                  bookingListEntity: widget.itemBookingList[index],
                  updateStatus: () {
                    setState(
                      () {},
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.colorWhile,
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemBookingList[index].type,
                            style: AppStyle().heading2,
                          ),
                          Text(
                            'Họ tên: ${widget.itemBookingList[index].name}',
                            style: AppStyle().heading4,
                          ),
                          Text(
                              'Thời gian: ${widget.itemBookingList[index].date}'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          VerticalDivider(
                            width: 0.5,
                            thickness: 0.25,
                            color: AppColor.colorGrey.withOpacity(0.4),
                          ),
                          const SizedBox(width: 10),
                          widget.itemBookingList[index].status == 'Waiting'
                              ? Text(
                                  '${widget.itemBookingList[index].status}...',
                                  style: AppStyle()
                                      .heading4
                                      .copyWith(color: AppColor.colorOrange),
                                )
                              : Text(
                                  widget.itemBookingList[index].status,
                                  style: AppStyle()
                                      .heading4
                                      .copyWith(color: AppColor.colorOrange),
                                ),
                        ],
                      ),
                    ),
                    //const Spacer(),
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
