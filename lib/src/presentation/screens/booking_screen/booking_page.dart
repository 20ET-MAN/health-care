import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:healthcare/src/presentation/widget/app_text_field.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.colorWhile,
        title: Text(
          'Booking',
          style: AppStyle().heading2.copyWith(fontSize: 27),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.appColorBg,
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin cá nhân',
                      style: AppStyle().heading4,
                    ),
                    const AppTextField(hint: 'Họ tên'),
                    const AppTextField(hint: 'Ngày sinh'),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: const [
                          Expanded(
                              child: AppNextBt(
                            label: 'Nam',
                            isActive: false,
                          )),
                          SizedBox(width: 10),
                          Expanded(
                              child: AppNextBt(
                            label: 'Nữ',
                            color: AppColor.colorBlackBlue,
                            isActive: false,
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thông tin Lịch hẹn', style: AppStyle().heading4),
                    const AppTextField(hint: 'Chọn bác sĩ'),
                    const AppTextField(hint: 'Ngày khám'),
                    const AppTextField(hint: 'Địa điểm'),
                  ],
                ),
                const SizedBox(height: 10),
                const AppNextBt(label: 'Đặt lịch khám trực tiếp'),
                const AppNextBt(
                  label: 'Đặt lịch khám tại nhà',
                  isActive: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
