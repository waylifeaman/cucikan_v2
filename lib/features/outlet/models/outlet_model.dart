import 'package:cloud_firestore/cloud_firestore.dart';

class OutletModel {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String? logoUrl;
  final String subscription;
  final bool status;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const OutletModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    this.logoUrl,
    required this.subscription,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory OutletModel.fromMap(Map<String, dynamic> map) {
    return OutletModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      logoUrl: map['logo_url'],
      subscription: map['subscription'] ?? 'free',
      status: map['status'] ?? true,
      createdAt: map['created_at'] as Timestamp?,
      updatedAt: map['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'logo_url': logoUrl,
      'subscription': subscription,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  OutletModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? logoUrl,
    String? subscription,
    bool? status,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return OutletModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      logoUrl: logoUrl ?? this.logoUrl,
      subscription: subscription ?? this.subscription,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
