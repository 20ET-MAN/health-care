import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/utils/firestore_constants.dart';

class MessageEntity {
  final String userId;
  final String userName;
  final String roomId;
  final String message;
  final int messageType;
  final String createdAt;

  const MessageEntity({
    required this.userId,
    required this.userName,
    required this.roomId,
    required this.message,
    required this.messageType,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.userId: userId,
      FirestoreConstants.roomId: roomId,
      FirestoreConstants.createdAt: createdAt,
      FirestoreConstants.userName: userName,
      FirestoreConstants.content: message,
      FirestoreConstants.type: messageType,
    };
  }

  factory MessageEntity.fromDocument(DocumentSnapshot doc) {
    String userId = doc.get(FirestoreConstants.userId);
    String roomId = doc.get(FirestoreConstants.roomId);
    String userName = doc.get(FirestoreConstants.userName);
    String createdAt = doc.get(FirestoreConstants.createdAt);
    String message = doc.get(FirestoreConstants.content);
    int messageType = doc.get(FirestoreConstants.type);
    return MessageEntity(
        userId: userId,
        userName: userName,
        roomId: roomId,
        message: message,
        messageType: messageType,
        createdAt: createdAt);
  }
}
