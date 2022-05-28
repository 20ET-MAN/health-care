import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

import '../../../domain/entities/doctor_entity.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({Key? key, required this.doctorEntity}) : super(key: key);

  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Thông tin bác sĩ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                width: double.infinity,
                child: doctorEntity.imageUrl == ''
                    ? Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9EXGE4pl-nm5WuxE6YJT2B3wFodTHkDD8dg&usqp=CAU')
                    : Image.network(
                        doctorEntity.imageUrl.toString(),
                        fit: BoxFit.fill,
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorEntity.fullName.toString(),
                    style: AppStyle().heading2,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Năm sinh: ${doctorEntity.dateOfBirth.toString()}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Giới tính: ${doctorEntity.sex.toString()}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Chức vụ: ${doctorEntity.rank}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Chuyên khoa: ${doctorEntity.departments}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Mô tả:\n${doctorEntity.description}',
                    style: AppStyle().heading4,
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
