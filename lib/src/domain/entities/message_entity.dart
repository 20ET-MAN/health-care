class MessageEntity {
  final String userId;
  final String userName;
  final String roomId;
  final String message;
  final int messageType;
  final DateTime createdAt;

  const MessageEntity({
    required this.userId,
    required this.userName,
    required this.roomId,
    required this.message,
    required this.messageType,
    required this.createdAt,
  });

  static MessageEntity fromJson(Map<String, dynamic> json) => MessageEntity(
        userId: json['userId'],
        userName: json['userName'],
        roomId: json['roomId'],
        message: json['message'],
        messageType: json['messageType'],
        createdAt: json['createdAt']?.toDate(),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'roomId': roomId,
        'message': message,
        'messageType': messageType,
        'createdAt': createdAt.toUtc(),
      };
}
