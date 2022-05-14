import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/booking_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../../domain/entities/booking_entity.dart';

class BookingListAdmin extends StatefulWidget {
  const BookingListAdmin({Key? key}) : super(key: key);

  @override
  State<BookingListAdmin> createState() => _BookingListAdminState();
}

class _BookingListAdminState extends State<BookingListAdmin> {
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
      backgroundColor: AppColor.appColorBg,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: futureBooking,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              print(itemBookingList);
              return ListView.builder(
                itemCount: itemBookingList?.length,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return itemBookingList?[index].bookingStatus == 2
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            context.router.push(BookingListDetailAdminRoute(
                                bookingListEntity: itemBookingList![index]));
                          },
                          child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          color: AppColor.colorGrey
                                              .withOpacity(0.4),
                                        ),
                                        const SizedBox(width: 10),
                                        itemBookingList![index].bookingStatus ==
                                                0
                                            ? Text(
                                                'Waiting...',
                                                style: AppStyle()
                                                    .heading4
                                                    .copyWith(
                                                        color: AppColor
                                                            .colorOrange),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.check_circle_outline,
                                                    color: AppColor.colorGreen,
                                                  ),
                                                  Text(
                                                    'Approve',
                                                    style: AppStyle()
                                                        .heading4
                                                        .copyWith(
                                                            color: AppColor
                                                                .colorGreen),
                                                  ),
                                                ],
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
