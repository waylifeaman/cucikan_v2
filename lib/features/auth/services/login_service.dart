import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/models/user_model.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/session_service.dart';

class LoginService {
  LoginService._();

  static final LoginService instance = LoginService._();

  final AuthService _authService = AuthService.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _authService.login(
      email: email,
      password: password,
    );
    await credential.user?.reload();

    if (!(credential.user?.emailVerified ?? false)) {
      await _authService.signOut();

      throw Exception(
        "Email Anda belum diverifikasi. Silakan cek email dan lakukan verifikasi terlebih dahulu.",
      );
    }
    final uid = credential.user!.uid;

    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) {
      throw Exception("Data user tidak ditemukan.");
    }

    final user = UserModel.fromMap(doc.data()!);

    await _firestore.collection('users').doc(uid).update({
      'last_login': Timestamp.now(),
    });

    await SessionService.saveOutletId(user.defaultOutletId);

    await SessionService.saveRole('owner');

    return user;
  }
}
