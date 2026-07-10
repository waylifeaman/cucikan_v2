import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../../../core/models/member_model.dart';
import '../../../core/models/outlet_model.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/auth_service.dart';

class RegisterService {
  RegisterService._();

  static final RegisterService instance = RegisterService._();

  final AuthService _authService = AuthService.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();

  Future<void> register({
    required String ownerName,
    required String outletName,
    required String phone,
    required String email,
    required String password,
  }) async {
    final now = Timestamp.now();
    // UserCredential credential;
    UserCredential? credential;
    try {
      credential = await _authService.register(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;
      final outletId = _uuid.v4();
      //berikut  unutk  mengambil outletmodel
      final outlet = OutletModel(
        id: outletId,
        ownerUid: uid,
        name: outletName,
        address: '',
        phone: phone,
        logoUrl: null,
        subscription: 'free',
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );

      //berikut untuk mengambil  user model
      final user = UserModel(
        uid: uid,
        name: ownerName,
        email: email,
        phone: phone,
        defaultOutletId: outletId,
        photoUrl: null,
        isActive: true,
        createdAt: now,
        updatedAt: now,
        lastLogin: now,
      );

      //berikut mengambil member model
      final member = MemberModel(
        uid: uid,
        role: 'owner',
        isActive: true,
        joinedAt: now,
        invitedBy: null,
      );

      final batch = _firestore.batch();
      final userRef = _firestore.collection('users').doc(uid);

      final outletRef = _firestore.collection('outlets').doc(outletId);
      final memberRef = outletRef.collection('members').doc(uid);
      batch.set(userRef, user.toMap());

      batch.set(outletRef, outlet.toMap());

      batch.set(memberRef, member.toMap());
      await batch.commit();
    } catch (e) {
      final firebaseUser = credential?.user;

      if (firebaseUser != null) {
        await firebaseUser.delete();
      }

      rethrow;
    }
  }
}
