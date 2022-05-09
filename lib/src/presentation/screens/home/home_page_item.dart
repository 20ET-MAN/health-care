import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/domain/entities/service_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

class HomePageGridItem extends StatefulWidget {
  HomePageGridItem({Key? key}) : super(key: key);

  final List<ServiceItemEntity> item = [
    ServiceItemEntity(
      'Test Covid',
      'Đăng kí test covid tại nhà, tại bệnh viện',
      'assets/icon/ic_covid.png',
      const HomePageRoute(),
    ),
    ServiceItemEntity(
      'Dịch vụ khám',
      'Đặt lích khám tại bệnh viện, hoặc tại nhà',
      'assets/icon/ic_service.png',
      const ServiceWebViewRoute(),
    ),
    ServiceItemEntity(
      'Bác sĩ',
      'Danh sách, thông tin chi tiết về các bác sĩ',
      'assets/icon/ic_doctor.png',
      DoctorPageRoute(),
    ),
    ServiceItemEntity(
      'Bệnh viện gần đây',
      'Kết nối các bệnh viện quanh bạn',
      'assets/icon/ic_hospital.png',
      const NearHospitalRoute(),
    ),
  ];

  @override
  _HomePageGridItemState createState() => _HomePageGridItemState();
}

class _HomePageGridItemState extends State<HomePageGridItem> {
  // set an int with value -1 since no card has been selected
  int selectedCard = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: MediaQuery.of(context).size.height / 4.5,
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //EasyLoading.show(status: 'Vui lòng đợi.....', dismissOnTap: true, d);
            setState(
              () {
                context.router.push(widget.item[index].screen);
                selectedCard = index;
                EasyLoading.dismiss();
              },
            );
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
              //height: 300,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      widget.item[index].iconSrc,
                      color: selectedCard == index
                          ? AppColor.colorWhile
                          : AppColor.colorOrange,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
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
