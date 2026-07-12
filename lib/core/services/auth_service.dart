import 'package:firebase_auth/firebase_auth.dart';
import 'package:cucikan_v2/core/exceptions/auth_exception.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// User yang sedang login
  User? get currentUser => _auth.currentUser;

  /// Mengecek apakah user sudah login
  bool get isLoggedIn => currentUser != null;

  /// Listener perubahan status login
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  /// Mengirim email verifikasi
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User tidak ditemukan.");
    }

    await user.sendEmailVerification();
  }

  /// Reload data user dari Firebase
  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }

  /// Status verifikasi email
  bool get isEmailVerified => currentUser?.emailVerified ?? false;

  /// Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //fungsi registrasi
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(AuthException.getMessage(e));
    } catch (_) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi.');
    }
  }

  //method login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(AuthException.getMessage(e));
    } catch (_) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi.');
    }
  }

  //methode lupa password
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw Exception(AuthException.getMessage(e));
    } catch (_) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi.');
    }
  }
}
