import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  final String uid;
  final String role;
  final bool isActive;
  final Timestamp joinedAt;
  final String? invitedBy;

  const MemberModel({
    required this.uid,
    required this.role,
    required this.isActive,
    required this.joinedAt,
    required this.invitedBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'role': role,
      'is_active': isActive,
      'joined_at': joinedAt,
      'invited_by': invitedBy,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      uid: map['uid'] ?? '',
      role: map['role'] ?? 'staff',
      isActive: map['is_active'] ?? true,
      joinedAt: map['joined_at'] ?? Timestamp.now(),
      invitedBy: map['invited_by'],
    );
  }
}
