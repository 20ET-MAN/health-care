import 'package:flutter/material.dart';

class AppDialog {
  final String title;
  final String content;
  final String leftBtLabel;
  final String rightBtLabel;
  VoidCallback? onpressRight;
  VoidCallback? onpressLeft;
  final bool? isShowLeftButton;

  AppDialog(
      {required this.title,
      this.onpressRight,
      this.onpressLeft,
      required this.content,
      this.leftBtLabel = 'Cancel',
      this.rightBtLabel = 'Oke',
      this.isShowLeftButton = false});

  showMyDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            content,
          ),
          actions: <Widget>[
            isShowLeftButton == true
                ? TextButton(
                    onPressed: onpressLeft?.call,
                    child: Text(leftBtLabel),
                  )
                : const SizedBox(),
            TextButton(
              onPressed: onpressRight?.call,
              child: Text(rightBtLabel),
            )
          ],
        );
      },
    );
  }
}
