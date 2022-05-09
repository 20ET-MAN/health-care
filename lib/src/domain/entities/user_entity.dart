class UserEntity {
  final String typeUser;
  final String fullName;
  final String imageUrl;
  final String userName;
  final String phoneNumber;
  final String dateOfBirth;
  final String creationDate;

  UserEntity({
    required this.fullName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.userName,
    required this.typeUser,
    required this.imageUrl,
    required this.creationDate,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        typeUser: json['typeUser'] as String,
        fullName: json['fullName'] as String,
        userName: json['userName'] as String,
        dateOfBirth: json['dateOfBirth'] as String,
        phoneNumber: json['phoneNumber'] as String,
        creationDate: json['creationDate'] as String,
        imageUrl: json['imageUrl'] as String);
  }
}
