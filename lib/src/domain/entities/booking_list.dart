class BookingListEntity {
  final String type;
  final String name;
  final String doctor;
  final String date;
  final String status;
  final String sex;
  final String description;

  BookingListEntity(
      {required this.type,
      required this.name,
      required this.doctor,
      required this.date,
      required this.status,
      required this.sex,
      required this.description});
}
