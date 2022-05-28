import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

import '../../../domain/entities/news_entity.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key, required this.item}) : super(key: key);

  final NewsEntity? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Tin tức'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '${item?.title}',
                style: AppStyle().heading2,
              ),
              const SizedBox(height: 10),
              Text(
                '${item?.description}',
                style: AppStyle().heading6,
              ),
              const SizedBox(height: 10),
              Text(
                '${item?.contentTop}',
                style: AppStyle().heading4,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  '${item?.thumbnailTop}',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${item?.contentCenter}',
                style: AppStyle().heading4,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  '${item?.thumbnailTop}',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${item?.contentBottom}',
                style: AppStyle().heading4,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Tác giả: ${item?.author}',
                    style: AppStyle().heading4,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
