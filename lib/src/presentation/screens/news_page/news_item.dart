import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/news_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../../domain/entities/news_entity.dart';
import '../../config/app_color.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  NewsController newsController = NewsController();
  Future<List<NewsEntity>>? employeeList;
  List<NewsEntity>? newsList;

  Future<void> _initRetrieval() async {
    employeeList = newsController.getNews();
    newsList = await newsController.getNews();
  }

  @override
  void initState() {
    _initRetrieval();
    setState(() {
      newsList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: employeeList,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
            itemCount: newsList?.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  context.router.push(NewsDetailRoute(item: newsList?[index]));
                },
                child: Container(
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
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColor.colorOrange,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.network(
                          newsList?[index].thumbnailTop ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsList?[index].title ?? '',
                              style: AppStyle().heading2,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              newsList?[index].description ?? '',
                              style: AppStyle().heading6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
