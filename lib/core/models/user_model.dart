import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String defaultOutletId;
  final String? photoUrl;
  final bool isActive;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final Timestamp? lastLogin;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.defaultOutletId,
    this.photoUrl,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      defaultOutletId: map['default_outlet_id'] ?? '',
      photoUrl: map['photo_url'],
      isActive: map['is_active'] ?? true,
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      lastLogin: map['last_login'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'default_outlet_id': defaultOutletId,
      'photo_url': photoUrl,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'last_login': lastLogin,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    bool? isActive,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    Timestamp? lastLogin,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      defaultOutletId: defaultOutletId ?? this.defaultOutletId,
      photoUrl: photoUrl ?? this.photoUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }
}
