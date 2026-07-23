import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  final String id;
  final String outletId;
  final String name;
  final String phone;
  final String address;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const CustomerModel({
    required this.id,
    required this.outletId,
    required this.name,
    required this.phone,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });
  factory CustomerModel.empty() {
    return const CustomerModel(
      id: '',
      outletId: '',
      name: '',
      phone: '',
      address: '',
      createdAt: null,
      updatedAt: null,
    );
  }
  factory CustomerModel.fromMap(String id, Map<String, dynamic> map) {
    return CustomerModel(
      id: id,
      outletId: map['outlet_id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      address: map['address'] as String? ?? '',
      createdAt: map['created_at'] as Timestamp?,
      updatedAt: map['updated_at'] as Timestamp?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'outlet_id': outletId,
      'name': name,
      'phone': phone,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  CustomerModel copyWith({
    String? id,
    String? outletId,
    String? name,
    String? phone,
    String? address,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      outletId: outletId ?? this.outletId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
