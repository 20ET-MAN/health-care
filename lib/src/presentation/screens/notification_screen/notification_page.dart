import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.colorWhile,
        title: Text(
          'Notification',
          style: AppStyle().heading2.copyWith(fontSize: 27),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.appColorBg,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yesterday',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Other',
                    style: AppStyle().heading2.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.colorWhile,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titleeeee',
                              style: AppStyle().heading2,
                            ),
                            const Text('Titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                          ],
                        )
                      ],
                    ),
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
