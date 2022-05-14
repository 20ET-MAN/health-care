import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';

class BookingEnd extends StatelessWidget {
  const BookingEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/image_brand_02.png'),
            const SizedBox(height: 60),
            Text(
              'Cảm ơn quý khách đã đặt lịch khám tại bệnh viện chúng tôi',
              style: AppStyle().heading2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppNextBt(
                label: 'Về trang chủ',
                onPressed: () {
                  context.router.replace(const HomeScreenRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
