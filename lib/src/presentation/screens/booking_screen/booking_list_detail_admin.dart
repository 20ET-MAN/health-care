import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/domain/entities/booking_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/booking_controller.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';

class BookingListDetailAdmin extends StatefulWidget {
  final BookingListEntity bookingListEntity;

  const BookingListDetailAdmin({Key? key, required this.bookingListEntity})
      : super(key: key);

  @override
  State<BookingListDetailAdmin> createState() => _BookingListDetailAdminState();
}

class _BookingListDetailAdminState extends State<BookingListDetailAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Thông tin lịch khám'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.bookingListEntity.typeService,
                      style: AppStyle().heading2,
                    ),
                    Text('Tên bệnh nhân: ${widget.bookingListEntity.fullName}',
                        style: AppStyle().heading4),
                    Text('Ngày sinh: ${widget.bookingListEntity.dateOfBirth}',
                        style: AppStyle().heading4),
                    Text('Giới tính: ${widget.bookingListEntity.sex}',
                        style: AppStyle().heading4),
                    widget.bookingListEntity.bookingStatus == 0
                        ? Text('Trạng thái: Đang chờ',
                            style: AppStyle().heading4)
                        : Text('Trạng thái: Xác nhận',
                            style: AppStyle().heading4),
                    Text(
                      'Thời gian khám: ${widget.bookingListEntity.bookingDate}',
                      style: AppStyle().heading4,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Bác Sĩ: ${widget.bookingListEntity.doctorSelector}',
                        style: AppStyle().heading4),
                    Text(
                        'Ngày đăng kí: ${widget.bookingListEntity.creationDate}',
                        style: AppStyle().heading4),
                    Text('Mô tả: ${widget.bookingListEntity.description}',
                        style: AppStyle().heading4),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 250),
              Column(
                children: [
                  AppNextBt(
                    color: AppColor.colorGreen,
                    label: 'Xác nhận hẹn',
                    onPressed: () {
                      if (widget.bookingListEntity.bookingStatus == 0) {
                        BookingController()
                            .updateStatus(1, widget.bookingListEntity.bkId);
                        EasyLoading.showSuccess('Xác nhận hẹn thành công');
                      }
                    },
                  ),
                  AppNextBt(
                    label: 'Từ chối hẹn',
                    onPressed: () {
                      if (widget.bookingListEntity.bookingStatus == 0) {
                        BookingController()
                            .updateStatus(-1, widget.bookingListEntity.bkId);
                        EasyLoading.showSuccess(
                            'Từ chối xác nhận hẹn thành công');
                      }
                    },
                  ),
                  AppNextBt(
                    label: 'Hoàn thành khám',
                    color: AppColor.colorGrey,
                    onPressed: () {
                      if (widget.bookingListEntity.bookingStatus == 1) {
                        BookingController()
                            .updateStatus(2, widget.bookingListEntity.bkId);
                        EasyLoading.showSuccess('Khám thành công');
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
