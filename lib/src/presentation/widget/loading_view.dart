import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColor.colorOrange,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
