import 'package:dio/dio.dart';

class CovidData {
  static void getCovidData() async {
    var dio = Dio();
    final response =
        await dio.get('https://covid19.gov.vn/ban-tin-covid-19.htm');
    print(response.data);
  }
}
