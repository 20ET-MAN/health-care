class NewEntity {
  final String id;
  final String title;
  final String content1;
  final String content2;
  final String imageContent1;
  final String imageContent2;

  NewEntity(
      {required this.id,
      required this.title,
      required this.content1,
      required this.content2,
      required this.imageContent1,
      required this.imageContent2});

  factory NewEntity.fromJson(Map<String, dynamic> json) => NewEntity(
      id: json['id'],
      title: json['title'],
      content1: json['content1'],
      content2: json['content2'],
      imageContent1: json['imageContent1'],
      imageContent2: json['imageContent2']);
}
