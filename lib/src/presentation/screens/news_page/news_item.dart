import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';

class NewsItem extends StatefulWidget {
  NewsItem({Key? key}) : super(key: key);

  final List<ListNewsModel> itemNews = [
    ListNewsModel('title', 'description1', 'imgSrc'),
    ListNewsModel('title1', 'description2', 'imgSrc'),
    ListNewsModel('title2', 'description3', 'imgSrc'),
    ListNewsModel('title3', 'description4', 'imgSrc'),
    ListNewsModel('title4', 'description5', 'imgSrc'),
    ListNewsModel('title5', 'description6', 'imgSrc'),
    ListNewsModel('title6', 'description7', 'imgSrc'),
    ListNewsModel('title7', 'description7', 'imgSrc'),
    ListNewsModel('title8', 'description8', 'imgSrc'),
    ListNewsModel('title8', 'description8', 'imgSrc'),
    ListNewsModel('title8', 'description8', 'imgSrc'),
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
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: ListTile(
            title: Text(
              widget.itemNews[index].title,
              style: AppStyle().heading2,
            ),
            leading: Text(widget.itemNews[index].description,
                style: AppStyle().heading2),
          ),
        );
      },
    );
  }
}

class ListNewsModel {
  ListNewsModel(this.title, this.description, this.imgSrc);
  final String title;
  final String description;
  final String? imgSrc;
}
