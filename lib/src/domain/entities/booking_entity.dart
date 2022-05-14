import 'package:cloud_firestore/cloud_firestore.dart';

class BookingListEntity {
  final String userId;
  final String bkId;
  final String fullName;
  final String dateOfBirth;
  final String sex;
  final String phoneNumber;
  final String typeService;
  final String doctorSelector;
  final String bookingDate;
  final int bookingStatus;
  final String description;
  final String creationDate;

  BookingListEntity(
      {required this.userId,
      required this.bkId,
      required this.fullName,
      required this.dateOfBirth,
      required this.sex,
      required this.phoneNumber,
      required this.typeService,
      required this.doctorSelector,
      required this.bookingDate,
      required this.bookingStatus,
      required this.description,
      required this.creationDate});

  factory BookingListEntity.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return BookingListEntity(
        userId: documentSnapshot['userId'],
        bkId: documentSnapshot['bkId'],
        fullName: documentSnapshot['fullName'],
        dateOfBirth: documentSnapshot['dateOfBirth'],
        sex: documentSnapshot['sex'],
        phoneNumber: documentSnapshot['phoneNumber'],
        typeService: documentSnapshot['typeService'],
        doctorSelector: documentSnapshot['doctorSelector'],
        bookingDate: documentSnapshot['bookingDate'],
        bookingStatus: documentSnapshot['bookingStatus'],
        description: documentSnapshot['description'],
        creationDate: documentSnapshot['creationDate']);
  }
}
