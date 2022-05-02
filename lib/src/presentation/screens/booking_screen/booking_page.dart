import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:healthcare/src/presentation/widget/app_text_field.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
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
                      style: AppStyle().heading2,
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
                            ),
                          ),
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
                    Text('Thông tin Lịch hẹn', style: AppStyle().heading2),
                    const AppTextField(hint: 'Chọn bác sĩ'),
                    const AppTextField(hint: 'Ngày khám'),
                    const AppTextField(hint: 'Địa điểm'),
                  ],
                ),
                const SizedBox(height: 10),
                const AppNextBt(label: 'Đặt lịch khám trực tiếp'),
                AppNextBt(
                  onPressed: () {
                    context.router.push(DoctorPageRoute());
                  },
                  label: 'Đặt lịch khám tại nhà',
                  isActive: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
