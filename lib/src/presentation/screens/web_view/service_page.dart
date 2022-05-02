import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config/app_color.dart';

class ServiceWebView extends StatefulWidget {
  const ServiceWebView({Key? key}) : super(key: key);

  @override
  State<ServiceWebView> createState() => _ServiceWebViewState();
}

class _ServiceWebViewState extends State<ServiceWebView> {
  late WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Dịch vụ khám bệnh tự nguyện'),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialUrl:
            'https://benhvienhadong.vn/category/dich-vu-kham-chua-benh-tu-nguyen',
      ),
    );
  }
}
