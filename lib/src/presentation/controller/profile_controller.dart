import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class ProfileController {
  Future<Map<String, dynamic>?> getUserName() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(firebaseUser?.uid)
        .get()
        .then((value) {
      final user = value.data();
      Map<String, dynamic> map = jsonDecode(value.data().toString());
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$map');
      final userE = UserEntity.fromJson(user as Map<String, dynamic>);

      return value.data();
    });
  }

/*  static Future<List<UserEntity>> _getEventsFromFirestore() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('events');
    DocumentSnapshot<Object?> eventsQuery = await ref
        .doc(firebaseUser?.uid).get();

    HashMap<String, UserEntity> eventsHashMap =  HashMap<String, UserEntity>();

    eventsQuery.forEach((document) {
      eventsHashMap.putIfAbsent(document['id'], () =>  UserEntity(uId: 'uId', fullName: 'fullname', dateOfBirth: 'dateOfBirth', phoneNumber: 'phoneNumber', userName: 'userName', typeUser: 'typeUser', imageUrl: 'imageUrl', creationDate: 'creationDate');

    return eventsHashMap.values.toList();
  }}*/
}
