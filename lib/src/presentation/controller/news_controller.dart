class NewsController {
  /*Future<List<NewEntity>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://619de317131c60001708917f.mockapi.io/apinews'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<NewEntity>((json) => NewEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }*/

  /*Future<UserEntity> fetchNews() async {
    try {
      Response response = await Dio()
          .get('https://619de317131c60001708917f.mockapi.io/apinews');
      if (response.statusCode == 200) {
        var getUsersData = response.data;

        final listNews =
            getUsersData.map((i) => NewEntity.fromJson(jsonDecode(i))).toList();
        print(listNews.toString());
        return listNews;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }*/
}
