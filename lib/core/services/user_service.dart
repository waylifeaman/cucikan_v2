import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  UserService._();

  static final UserService instance = UserService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection('users');

  //method create user
  Future<void> createUser(UserModel user) async {
    try {
      await _users.doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      throw Exception('Gagal Input data pengguna: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat input data pengguna.');
    }
  }

  //get user
  Future<UserModel?> getUser(String uid) async {
    try {
      final document = await _users.doc(uid).get();

      if (!document.exists) {
        return null;
      }

      return UserModel.fromMap(document.data()!);
    } on FirebaseException catch (e) {
      throw Exception('Gagal mengambil data pengguna: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat mengambil data pengguna.');
    }
  }

  /// Memperbarui data user
  Future<void> updateUser(UserModel user) async {
    try {
      await _users.doc(user.uid).update(user.toMap());
    } on FirebaseException catch (e) {
      throw Exception('Gagal memperbarui data pengguna: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat memperbarui data pengguna.');
    }
  }

  /// Menghapus data user
  Future<void> deleteUser(String uid) async {
    try {
      await _users.doc(uid).delete();
    } on FirebaseException catch (e) {
      throw Exception('Gagal menghapus data pengguna: ${e.message}');
    } catch (_) {
      throw Exception('Terjadi kesalahan saat menghapus data pengguna.');
    }
  }
}
