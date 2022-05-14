import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/doctor_entity.dart';

class DoctorController {
  Future<List<DoctorEntity>> getDoctor() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('Doctor').get();
    final doctorData = snapshot.docs
        .map((docSnapshot) => DoctorEntity.fromDocumentSnapshot(docSnapshot))
        .toList();
    return doctorData;
  }

  Future<void> doctorSetup(
      {required String dateOfBirth,
      required String departments,
      required String description,
      required String imageUrl,
      required String phone,
      required String fullName,
      required String rank,
      required String sex,
      required int typeDoctor}) async {
    final doctor = FirebaseFirestore.instance.collection('Doctor').doc();
    doctor.set({
      'dateOfBirth': dateOfBirth,
      'departments': departments,
      'description': description,
      'imageUrl': imageUrl,
      'phone': phone,
      'fullName': fullName,
      'rank': rank,
      'sex': sex,
      'typeDoctor': typeDoctor,
      'uId': doctor.id,
    });
    return;
  }
}
