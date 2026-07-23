import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String unit;
  final bool isActive;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.unit,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.empty() {
    return const ProductModel(
      id: '',
      name: '',
      description: null,
      price: 0,
      unit: 'kg',
      isActive: true,
      createdAt: null,
      updatedAt: null,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'],
      price: (map['price'] ?? 0).toDouble(),
      unit: map['unit'] ?? 'kg',
      isActive: map['is_active'] ?? true,
      createdAt: map['created_at'] as Timestamp?,
      updatedAt: map['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'unit': unit,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? unit,
    bool? isActive,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
