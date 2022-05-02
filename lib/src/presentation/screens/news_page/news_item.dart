import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../../domain/entities/new_entity.dart';

class NewsItem extends StatefulWidget {
  NewsItem({Key? key}) : super(key: key);

  final List<NewEntity> itemNews = [
    NewEntity('title', 'description1', 'imgSrc'),
    NewEntity('title1', 'description2', 'imgSrc'),
    NewEntity('title2', 'description3', 'imgSrc'),
    NewEntity('title3', 'description4', 'imgSrc'),
    NewEntity('title4', 'description5', 'imgSrc'),
    NewEntity('title5', 'description6', 'imgSrc'),
    NewEntity('title6', 'description7', 'imgSrc'),
    NewEntity('title7', 'description7', 'imgSrc'),
    NewEntity('title8', 'description8', 'imgSrc'),
    NewEntity('title8', 'description8', 'imgSrc'),
    NewEntity('title8', 'description8', 'imgSrc'),
  ];

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemNews.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.router.push(NewsDetailRoute(item: widget.itemNews[index]));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: ListTile(
              title: Text(
                widget.itemNews[index].title,
                style: AppStyle().heading2,
              ),
              subtitle: Text(widget.itemNews[index].description,
                  style: AppStyle().heading2),
            ),
          ),
        );
      },
    );
  }
}
