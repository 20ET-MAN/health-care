import 'package:flutter/material.dart';

class NearHospital extends StatelessWidget {
  const NearHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
