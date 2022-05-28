import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare/src/domain/entities/booking_entity.dart';

class BookingController {
  Future<void> createBookingList(
      {required String fullName,
      required String dateOfBirth,
      required String sex,
      required String phoneNumber,
      required String typeService,
      required String doctorSelector,
      required String bookingDate,
      required int bookingStatus,
      required String description,
      required String creationDate}) async {
    final booking = FirebaseFirestore.instance.collection('BookingList').doc();
    booking.set({
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'bkId': booking.id,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'phoneNumber': phoneNumber,
      'typeService': typeService,
      'doctorSelector': doctorSelector,
      'bookingDate': bookingDate,
      'bookingStatus': bookingStatus,
      'description': description,
      'creationDate': creationDate
    });
  }

  Future<List<BookingListEntity>> getBooking() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('BookingList').get();
    final bookingData = snapshot.docs
        .map((docSnapshot) =>
            BookingListEntity.fromDocumentSnapshot(docSnapshot))
        .toList();
    return bookingData;
  }

  Future<void> updateStatus(int status, String bkId) async {
    final booking =
        FirebaseFirestore.instance.collection('BookingList').doc(bkId);

    booking.update({
      'bookingStatus': status,
    });
  }
}
