import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/doctor.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({Key? key, required this.doctorEntity}) : super(key: key);

  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        title: Text(
          'Bác sĩ',
          style: AppStyle().heading2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  'https://image.thanhnien.vn/w2048/Uploaded/2022/tnabtw/2022_02_14/doctor-strange-2-8873.jpg',
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
                    doctorEntity.name,
                    style: AppStyle().heading2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tuổi: ${doctorEntity.age.toString()}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Số năm kinh nghiệm: ${doctorEntity.exp}',
                    style: AppStyle().heading4,
                  ),
                  Text(
                    'Mô tả:\n${doctorEntity.description}',
                    style: AppStyle().heading4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
