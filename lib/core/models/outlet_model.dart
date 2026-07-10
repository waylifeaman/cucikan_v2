import 'package:cloud_firestore/cloud_firestore.dart';

class OutletModel {
  final String id;
  final String ownerUid;
  final String name;
  final String address;
  final String phone;
  final String? logoUrl;
  final String subscription;
  final bool isActive;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const OutletModel({
    required this.id,
    required this.ownerUid,
    required this.name,
    required this.address,
    required this.phone,
    this.logoUrl,
    required this.subscription,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory OutletModel.fromMap(Map<String, dynamic> map) {
    return OutletModel(
      id: map['id'] ?? '',
      ownerUid: map['owner_uid'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      logoUrl: map['logo_url'],
      subscription: map['subscription'] ?? 'free',
      isActive: map['isActive'] ?? true,
      createdAt: map['created_at'] as Timestamp?,
      updatedAt: map['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner_id': ownerUid,
      'name': name,
      'address': address,
      'phone': phone,
      'logo_url': logoUrl,
      'subscription': subscription,
      'isActive': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  OutletModel copyWith({
    String? id,
    String? ownerUid,
    String? name,
    String? address,
    String? phone,
    String? logoUrl,
    String? subscription,
    bool? isActive,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return OutletModel(
      id: id ?? this.id,
      ownerUid: ownerUid ?? this.ownerUid,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      logoUrl: logoUrl ?? this.logoUrl,
      subscription: subscription ?? this.subscription,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
