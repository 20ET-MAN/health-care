import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

import 'home_page_grid_item.dart';

class HomePageGridItem extends StatefulWidget {
  HomePageGridItem({Key? key}) : super(key: key);

  final List<ServiceItemModel> item = [
    ServiceItemModel(
        'Test Covid', 'Đăng kí test covid tại nhà, tại bệnh viện', 'iconSrc'),
    ServiceItemModel('Đặt lịch khám',
        'Đặt lích khám tại bệnh viện, hoặc tại nhà', 'iconSrc'),
    ServiceItemModel(
        'Doctor', 'Danh sách, thông tin chi tiết về các bác sĩ', 'iconSrc'),
    ServiceItemModel(
        'Bệnh viện gần đây', 'Kết nối các bệnh viện quanh bạn', 'iconSrc'),
  ];

  @override
  _HomePageGridItemState createState() => _HomePageGridItemState();
}

class _HomePageGridItemState extends State<HomePageGridItem> {
  // set an int with value -1 since no card has been selected
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // ontap of each card, set the defined int to the grid view index
              selectedCard = index;
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: selectedCard == index
                ? AppColor.colorBlackBlue
                : AppColor.colorWhile,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/icon/ic_google.svg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.item[index].title,
                    style: selectedCard == index
                        ? AppStyle().heading1
                        : AppStyle().heading2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.item[index].label,
                    style: selectedCard == index
                        ? AppStyle().heading5
                        : AppStyle().heading4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
