import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

import '../config/app_color.dart';

class ServiceWebView extends StatelessWidget {
  const ServiceWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Dịch vụ khám bệnh tự nguyện'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 15),
              ItemWidgetCenter(
                  title: 'Bảo vệ sức khoẻ',
                  content:
                      'Lấy máu xét nghiệm tại nhà giúp khách hàng chủ động tầm soát bệnh lý định kỳ, sớm phát hiện các bệnh lý bất thường để từ đó có hướng điều trị phù hợp. Bên cạnh đó, dịch vụ còn giúp người bệnh theo dõi tiến triển của một số bệnh lý chuyển hóa như: đường máu, mỡ máu, men gan, gout,… từ đó bệnh nhân có hướng điều chỉnh chế độ ăn uống và sinh hoạt hợp lý, nâng cao chất lượng sức khỏe.',
                  iconData: Icons.home_outlined),
              ItemWidgetCenter(
                  title: 'Tính tiện lợi',
                  content:
                      'Lấy mẫu xét nghiệm tại nhà giúp giảm thời gian đi lại, chờ đợi. Kết quả xét nghiệm sẽ được trả ngay tại nhà hoặc tra cứu kết quả trên website: benhviendakhoahadong.vn app Health Care của bệnh viện. Ngoài ra, lấy máu xét nghiệm tại nhà còn giúp giảm khả năng lây nhiễm chéo trong bệnh viện, người bệnh sau khi có kết quả xét nghiệm sẽ được bác sĩ gọi điện tư vấn bệnh lý và điều chỉnh chế độ ăn uống sinh hoạt (nếu có).',
                  iconData: Icons.account_balance_outlined),
              ItemWidgetCenter(
                  title: 'Chi phí xét nghiệm hợp lý',
                  content:
                      'Giá dịch vụ xét nghiệm tại nhà được niêm yết theo đúng bảng giá khách hàng sử dụng dịch vụ tại bệnh viện, phòng khám của Bệnh viện đa khoa Hà Đông và chỉ chỉ mất thêm phụ phí đi lại là 10.000đ/ lần lấy mẫu.',
                  iconData: Icons.monetization_on_outlined),
              ItemWidgetCenter(
                  title: 'Nhanh chóng',
                  content:
                      'Sau khi nhận được lịch đặt của khách hàng, nhân viên lấy mẫu sẽ gọi điện xác nhận thời gian và địa chỉ lấy mẫu xét nghiệm, đồng thời đến đúng theo lịch. Ngoài ra, tùy từng xét nghiệm sẽ có thời gian trả kết quả khác nhau, với hệ thông trang thiết bị, máy móc xét nghiệm được đầu tư hiện đại khách hàng sẽ nhận được kết quả chỉ từ 2 giờ.',
                  iconData: Icons.timer_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidgetCenter extends StatelessWidget {
  const ItemWidgetCenter(
      {Key? key,
      required this.title,
      required this.content,
      required this.iconData})
      : super(key: key);
  final String title;
  final String content;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.colorOrange.withOpacity(0.7),
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  CircleAvatar(
                    child: Icon(
                      iconData,
                      size: 60,
                      color: AppColor.colorOrange,
                    ),
                    backgroundColor: AppColor.colorWhile,
                    radius: 60,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    title,
                    style: AppStyle().heading2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    content,
                    style: AppStyle().heading4,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
