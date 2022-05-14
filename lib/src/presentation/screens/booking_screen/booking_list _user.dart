import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/booking_entity.dart';
import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../controller/booking_controller.dart';

class BookingListUser extends StatefulWidget {
  const BookingListUser({Key? key}) : super(key: key);

  @override
  State<BookingListUser> createState() => _BookingListUserState();
}

class _BookingListUserState extends State<BookingListUser> {
  BookingController bookingController = BookingController();

  Future<List<BookingListEntity>>? futureBooking;
  List<BookingListEntity>? itemBookingList;

  Future<void> _initRetrieval() async {
    futureBooking = bookingController.getBooking();
    itemBookingList = await bookingController.getBooking();
  }

  @override
  void initState() {
    _initRetrieval();
    super.initState();
  }

  Future<void> _refresh() async {
    await _initRetrieval();
    setState(() {
      itemBookingList;
    });
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Lịch khám của tôi'),
        centerTitle: true,
      ),
      backgroundColor: AppColor.appColorBg,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: futureBooking,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: itemBookingList?.length,
                //physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if (itemBookingList?[index].userId ==
                      FirebaseAuth.instance.currentUser?.uid) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
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
                                    itemBookingList![index].typeService,
                                    style: AppStyle().heading2,
                                  ),
                                  Text(
                                    'Họ tên: ${itemBookingList![index].fullName}',
                                    style: AppStyle().heading4,
                                  ),
                                  Text(
                                      'Hẹn khám ngày: ${itemBookingList![index].bookingDate}'),
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
                                  if (itemBookingList![index].bookingStatus ==
                                      0)
                                    Text(
                                      'Đang chờ...',
                                      style: AppStyle().heading4.copyWith(
                                          color: AppColor.colorOrange),
                                    )
                                  else if (itemBookingList![index]
                                          .bookingStatus ==
                                      1)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check_circle_outline,
                                          color: AppColor.colorGreen,
                                        ),
                                        Text('Xác nhận',
                                            style: AppStyle().heading4.copyWith(
                                                color: AppColor.colorGreen)),
                                      ],
                                    )
                                  else if (itemBookingList![index]
                                          .bookingStatus ==
                                      -1)
                                    Text('Bị từ chối',
                                        style: AppStyle().heading4.copyWith(
                                            color: AppColor.colorOrange))
                                  else if (itemBookingList![index]
                                          .bookingStatus ==
                                      2)
                                    Text('Hoàn thành',
                                        style: AppStyle().heading4.copyWith(
                                            color: AppColor.colorOrange))
                                ],
                              ),
                            ),
                            //const Spacer(),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
