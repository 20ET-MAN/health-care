import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Hướng dẫn khám bệnh'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Nhằm phục vụ tốt nhất nhu cầu khám chữa bệnh của quý khách hàng, bên cạnh việc tư vấn, khám và điều trị trực tiếp tại bệnh viện. dịch vụ Health Care cung cấp hướng dẫn đến quý khách hàng nhằm đem lại trải nghiệm dịch vụ tốt nhất. \nChúc quý khách có trải nghiệm tốt nhất khi sử dụng dịch vụ của chúng tôi',
              style: AppStyle().heading4,
            ),
            const SizedBox(height: 10),
            const HelpItem(
                title: 'Khám tại bệnh viện',
                label:
                    'Với các bệnh nhân muốn khám trực tiếp tại bệnh viện mà gặp vấn đề khi đặt lịch quý khách có thể liên hệ trực tiếp tới số điện thoại: 0362557072',
                iconData: Icons.home_outlined),
            const HelpItem(
                title: 'Tư vấn trực tuyến',
                label:
                    'Với các bệnh nhân ở xa không thể tham gia khám trực tiếp quý khách có thể liên hệ tới số điện thoai 0362557072',
                iconData: Icons.phone),
            const HelpItem(
                title: 'Tư vấn hỗ trợ mua thuốc',
                label:
                    'Với các bệnh nhân ở xa không thể tham gia khám trực tiếp quý khách có thể liên hệ tới số điện thoai 0362557072',
                iconData: Icons.car_rental),
          ],
        ),
      ),
    );
  }
}

class HelpItem extends StatelessWidget {
  const HelpItem(
      {Key? key,
      required this.title,
      required this.label,
      required this.iconData})
      : super(key: key);
  final String title;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.colorOrange,
            ),
            child: Icon(
              iconData,
              color: AppColor.colorWhile,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle().heading2,
                ),
                const SizedBox(height: 5),
                Text(label, style: AppStyle().heading4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
