import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  //final String uId;
  final String typeUser;
  final String fullName;
  final String userName;
  final String sex;
  final String phoneNumber;
  final String dateOfBirth;
  final String creationDate;
  final int userStatus;

  UserEntity({
    required this.fullName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.userName,
    required this.sex,
    required this.typeUser,
    required this.creationDate,
    required this.userStatus,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      //uId: json['uId'],
      typeUser: json['typeUser'],
      fullName: json['displayName'],
      userName: json['userName'],
      sex: json['sex'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      creationDate: json['creationDate'],
      userStatus: json['userStatus'],
    );
    //imageUrl: json['imageUrl']);
  }
  factory UserEntity.fromDocument(DocumentSnapshot document) {
    return UserEntity(
      typeUser: document['typeUser'],
      fullName: document['fullName'],
      userName: document['userName'],
      sex: document['sex'],
      dateOfBirth: document['dateOfBirth'],
      phoneNumber: document['phoneNumber'],
      creationDate: document['creationDate'],
      userStatus: document['userStatus'],
    );
  }
}
