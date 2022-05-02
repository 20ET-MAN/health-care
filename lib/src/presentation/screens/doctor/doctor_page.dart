import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/doctor.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class DoctorPage extends StatelessWidget {
  DoctorPage({Key? key}) : super(key: key);

  final List<DoctorEntity> doctorList = [
    DoctorEntity(
      'title1111111111111111',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title2222222222222',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title3333333333333',
      30,
      'ahhahahahahahahahahahhhahahahahahahahahahhhahahahahahahahahahhhahahahahahahahahahhhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title4444444444444',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title5555555555555',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title66666666666666',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title777777777777777',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title8888888888888888',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title99999999999999999',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title10000000000000000',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
    DoctorEntity(
      'title11111111111111111',
      30,
      'ahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahahahhahahahahahahahahah',
      '60',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: doctorList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.router
                  .push(DoctorDetailRoute(doctorEntity: doctorList[index]));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.colorWhile,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.colorOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    //child: SvgPicture.asset(svgSrc),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorList[index].name,
                        style: AppStyle().heading2,
                      ),
                      Text(
                        doctorList[index].age.toString(),
                        style: AppStyle().heading2,
                      ),
                      Text(
                        doctorList[index].exp,
                        style: AppStyle().heading2,
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
