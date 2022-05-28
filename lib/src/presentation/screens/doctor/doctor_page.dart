import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/doctor_entity.dart';
import 'package:healthcare/src/presentation/controller/doctor_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DoctorController doctorController = DoctorController();
  Future<List<DoctorEntity>>? employeeList;
  List<DoctorEntity>? doctorList;

  Future<void> _initRetrieval() async {
    employeeList = doctorController.getDoctor();
    doctorList = await doctorController.getDoctor();
  }

  @override
  void initState() {
    _initRetrieval();
    super.initState();
  }

  Future<void> _refresh() async {
    await _initRetrieval();
    setState(() {
      doctorList;
    });
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Thông tin bác sĩ'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: employeeList,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: doctorList?.length,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return doctorList?[index].typeDoctor == 1
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            context.router.push(DoctorDetailRoute(
                                doctorEntity: doctorList![index]));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.colorWhile,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: (doctorList?[index].imageUrl ??
                                                    '')
                                                .isEmpty
                                            ? const NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9EXGE4pl-nm5WuxE6YJT2B3wFodTHkDD8dg&usqp=CAU')
                                            : NetworkImage(
                                                doctorList?[index].imageUrl ??
                                                    ''),
                                        fit: BoxFit.fill),
                                    color: AppColor.colorOrange,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  //child: SvgPicture.asset(svgSrc),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctorList?[index].fullName ?? '',
                                        style: AppStyle().heading2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          'Chuyên khoa: ${doctorList?[index].departments ?? ''}',
                                          style: AppStyle().heading4),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                        );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
