import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserController {
  Future<void> userSetup(
      {required String fullName,
      required String typeUser,
      required String uId,
      required String userName,
      required String sex,
      required String images,
      required String dateOfBirth,
      required String phoneNumber,
      required int userStatus,
      required String creationDate}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final users = FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser?.uid);
    users.set({
      'uId': uId,
      'fullName': fullName,
      'userName': userName,
      'sex': sex,
      'images': images,
      'typeUser': typeUser,
      'userStatus': userStatus,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'creationDate': creationDate
    });
    return;
  }

  Future<UserEntity> getCurrentUser() async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    final userData = UserEntity.fromDocument(await usersCollection
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get());
    return userData;
  }
}
