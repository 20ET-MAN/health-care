import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config/app_color.dart';

class CovidDataPage extends StatefulWidget {
  const CovidDataPage({Key? key}) : super(key: key);

  @override
  State<CovidDataPage> createState() => _CovidDataPageState();
}

class _CovidDataPageState extends State<CovidDataPage> {
  late WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Dữ liệu Covid'),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialUrl: 'https://covid19.ncsc.gov.vn/dulieu',
      ),
    );
  }
}
