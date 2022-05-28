import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorEntity {
  final String dateOfBirth;
  final String departments;
  final String description;
  final String imageUrl;
  final String phone;
  final String fullName;
  final String rank;
  final String sex;
  final String dId;
  final int typeDoctor;

  DoctorEntity(
      {required this.dateOfBirth,
      required this.departments,
      required this.description,
      required this.imageUrl,
      required this.phone,
      required this.fullName,
      required this.rank,
      required this.sex,
      required this.dId,
      required this.typeDoctor});

/*  factory DoctorEntity.fromSnapshot(DocumentSnapshot document) {
    return DoctorEntity(
      dateOfBirth: document['dateOfBirth'],
      departments: document['departments'],
      description: document['description'],
      phone: document['phone'],
      imageUrl: document['imageUrl'],
      fullName: document['fullName'],
      rank: document['rank'],
      sex: document['sex'],
      dId: document['uId'],
      typeDoctor: document['typeDoctor'],
    );
  }*/
  factory DoctorEntity.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return DoctorEntity(
      dateOfBirth: document['dateOfBirth'],
      departments: document['departments'],
      description: document['description'],
      imageUrl: document['imageUrl'],
      phone: document['phone'],
      fullName: document['fullName'],
      rank: document['rank'],
      sex: document['sex'],
      dId: document['uId'],
      typeDoctor: document['typeDoctor'],
    );
  }
}
