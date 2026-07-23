import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../core/services/session_service.dart';
import '../models/customer_model.dart';

class CustomerService {
  CustomerService._();

  static final CustomerService instance = CustomerService._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();

  //=====================================================
  //HELPER
  //====================================================
  Future<CollectionReference<Map<String, dynamic>>>
  _customerCollection() async {
    final outletId = await SessionService.getOutletId();
    if (outletId == null) {
      throw Exception("Outlet tidak ditemukan.");
    }
    return _firestore
        .collection('outlets')
        .doc(outletId)
        .collection('customers');
  }

  //=======================================================
  //CREATE
  //=======================================================
  Future<void> createCustomer(CustomerModel customer) async {
    final collection = await _customerCollection();
    final now = Timestamp.now();
    final id = _uuid.v4();
    final outletId = await SessionService.getOutletId();
    final newCustomer = customer.copyWith(
      id: id,
      outletId: outletId,
      createdAt: now,
      updatedAt: now,
    );
    await collection.doc(id).set(newCustomer.toMap());
  }

  //=======================================================
  //READ
  //=======================================================

  Stream<List<CustomerModel>> streamCustomers() async* {
    final collection = await _customerCollection();

    yield* collection
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CustomerModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  //=========================================================
  //Get BY Id
  //=========================================================
  Future<CustomerModel?> getCustomer(String customerId) async {
    final collection = await _customerCollection();

    final doc = await collection.doc(customerId).get();
    if (!doc.exists) {
      return null;
    }
    return CustomerModel.fromMap(doc.id, doc.data()!);
  }

  //========================================================
  //UPDATE
  //========================================================
  Future<void> updateCustomer(CustomerModel customer) async {
    final collection = await _customerCollection();

    await collection
        .doc(customer.id)
        .update(customer.copyWith(updatedAt: Timestamp.now()).toMap());
  }
  //==========================================================
  // DELETE
  //==========================================================

  Future<void> deleteCustomer(String customerId) async {
    final collection = await _customerCollection();

    await collection.doc(customerId).delete();
  }
}
