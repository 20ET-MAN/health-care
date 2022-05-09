import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    {required String fullName,
    required String typeUser,
    required String userName,
    required String dateOfBirth,
    required String phoneNumber,
    required String creationDate}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final users =
      FirebaseFirestore.instance.collection('Users').doc(auth.currentUser?.uid);
  users.set({
    'fullName': fullName,
    'userName': userName,
    'typeUser': typeUser,
    'dateOfBirth': dateOfBirth,
    'phoneNumber': phoneNumber,
    'creationDate': creationDate
  });

  return;
}
