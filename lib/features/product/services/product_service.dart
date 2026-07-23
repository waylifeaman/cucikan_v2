import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/session_service.dart';
import '../models/product_model.dart';

class ProductService {
  ProductService._();

  static final ProductService instance = ProductService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();

  //==========================================================
  // Helper
  //==========================================================

  Future<CollectionReference<Map<String, dynamic>>> _productCollection() async {
    final outletId = await SessionService.getOutletId();

    if (outletId == null) {
      throw Exception("Outlet tidak ditemukan.");
    }

    return _firestore
        .collection('outlets')
        .doc(outletId)
        .collection('products');
  }

  //==========================================================
  // CREATE
  //==========================================================

  Future<void> createProduct(ProductModel product) async {
    final collection = await _productCollection();

    final now = Timestamp.now();

    final id = _uuid.v4();

    final newProduct = product.copyWith(id: id, createdAt: now, updatedAt: now);

    await collection.doc(id).set(newProduct.toMap());
  }

  //==========================================================
  // READ
  //==========================================================

  Stream<List<ProductModel>> streamProducts() async* {
    final collection = await _productCollection();

    yield* collection
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ProductModel.fromMap(doc.data()))
              .toList(),
        );
  }

  //==========================================================
  // GET BY ID
  //==========================================================

  Future<ProductModel?> getProduct(String productId) async {
    final collection = await _productCollection();

    final doc = await collection.doc(productId).get();

    if (!doc.exists) {
      return null;
    }

    return ProductModel.fromMap(doc.data()!);
  }

  //==========================================================
  // UPDATE
  //==========================================================

  Future<void> updateProduct(ProductModel product) async {
    final collection = await _productCollection();

    await collection
        .doc(product.id)
        .update(product.copyWith(updatedAt: Timestamp.now()).toMap());
  }

  //==========================================================
  // DELETE
  //==========================================================

  Future<void> deleteProduct(String productId) async {
    final collection = await _productCollection();

    await collection.doc(productId).delete();
  }
}
