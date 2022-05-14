import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/news_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../../domain/entities/news_entity.dart';

class NewsItem extends StatefulWidget {
  NewsItem({Key? key}) : super(key: key);

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  NewsController newsController = NewsController();
  List<NewEntity>? itemNews;

  Future<void> getListNews() async {
    //itemNews = await NewsController().fetchNews();
  }

  @override
  void initState() {
    getListNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemNews?.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.router.push(NewsDetailRoute(item: itemNews![index]));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: ListTile(
              title: Text(
                itemNews![index].title,
                style: AppStyle().heading2,
              ),
              subtitle:
                  Text(itemNews![index].content1, style: AppStyle().heading2),
            ),
          ),
        );
      },
    );
  }
}
