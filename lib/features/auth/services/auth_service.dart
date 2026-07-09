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
}
