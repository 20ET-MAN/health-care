import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final String uId;
  final String chattingWith;
  final String typeUser;
  final String fullName;
  final String userName;
  final String sex;
  final String phoneNumber;
  final String dateOfBirth;
  final String creationDate;
  final String image;
  final int userStatus;

  UserEntity({
    required this.uId,
    required this.chattingWith,
    required this.fullName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.image,
    required this.userName,
    required this.sex,
    required this.typeUser,
    required this.creationDate,
    required this.userStatus,
  });

  Map<String, String> toJson() {
    return {
      'uId': uId,
      'chattingWith': chattingWith,
      'typeUser': typeUser,
      'fullName': fullName,
      'userName': userName,
      'images': image,
      'sex': sex,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'creationDate': creationDate,
      'userStatus': userStatus.toString(),
    };
  }

  factory UserEntity.fromDocument(DocumentSnapshot document) {
    return UserEntity(
      uId: document['uId'],
      chattingWith: document['chattingWith'],
      typeUser: document['typeUser'],
      fullName: document['fullName'],
      userName: document['userName'],
      image: document['images'],
      sex: document['sex'],
      dateOfBirth: document['dateOfBirth'],
      phoneNumber: document['phoneNumber'],
      creationDate: document['creationDate'],
      userStatus: document['userStatus'],
    );
  }
}
