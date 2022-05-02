import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    late WebViewController webViewController;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Quy trình khám chữa bệnh tự nguyện'),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialUrl:
            'https://benhvienhadong.vn/new/detail/quy-trinh-kham-chua-benh-tu-nguyen',
      ),
    );
  }
}
