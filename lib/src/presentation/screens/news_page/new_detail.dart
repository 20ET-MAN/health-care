import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

import '../../../domain/entities/new_entity.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key, required this.item}) : super(key: key);

  final NewEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppStyle().heading2,
            ),
            SizedBox(height: 20),
            Text(
              item.description,
              style: AppStyle().heading4,
            ),
          ],
        ),
      ),
    );
  }
}
