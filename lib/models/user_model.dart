// lib/models/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '', // Convert int to String if necessary
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'], 
    );
  }
}
