import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/booking_list.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';

class BookingListDetailAdmin extends StatefulWidget {
  const BookingListDetailAdmin(
      {Key? key, required this.bookingListEntity, required this.updateStatus})
      : super(key: key);
  final BookingListEntity bookingListEntity;
  final VoidCallback updateStatus;

  @override
  State<BookingListDetailAdmin> createState() => _BookingListDetailAdminState();
}

class _BookingListDetailAdminState extends State<BookingListDetailAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin chi tiết'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.bookingListEntity.type,
                    style: AppStyle().heading2,
                  ),
                  Text('Tên bệnh nhân: ${widget.bookingListEntity.name}',
                      style: AppStyle().heading4),
                  Text('Giới tính: ${widget.bookingListEntity.sex}',
                      style: AppStyle().heading4),
                  Text('Trạng thái: ${widget.bookingListEntity.status}',
                      style: AppStyle().heading4),
                  Text(
                    'Thời gian khám: ${widget.bookingListEntity.date}',
                    style: AppStyle().heading4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('Bác Sĩ: ${widget.bookingListEntity.doctor}',
                      style: AppStyle().heading4),
                  Text('Mô tả: ${widget.bookingListEntity.description}',
                      style: AppStyle().heading4),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Column(
              children: [
                AppNextBt(
                  label: 'Xác nhận',
                  onPressed: () {
                    widget.updateStatus;
                  },
                ),
                const AppNextBt(label: 'Từ chối', color: AppColor.colorGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
