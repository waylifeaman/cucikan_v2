import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/outlet_model.dart';
import '../../../core/models/user_model.dart';

class HomeService {
  HomeService._();

  static final HomeService instance = HomeService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();

    return UserModel.fromMap(doc.data()!);
  }

  Future<OutletModel> getOutlet(String outletId) async {
    final doc = await _firestore.collection('outlets').doc(outletId).get();

    return OutletModel.fromMap(doc.data()!);
  }
}
