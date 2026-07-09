import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  static String getMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email sudah digunakan.';

      case 'invalid-email':
        return 'Format email tidak valid.';

      case 'user-not-found':
        return 'Email belum terdaftar.';

      case 'wrong-password':
        return 'Password salah.';

      case 'weak-password':
        return 'Password minimal 6 karakter.';

      case 'invalid-credential':
        return 'Email atau password salah.';

      case 'network-request-failed':
        return 'Tidak ada koneksi internet.';

      case 'too-many-requests':
        return 'Terlalu banyak percobaan login. Coba lagi nanti.';

      default:
        return e.message ?? 'Terjadi kesalahan.';
    }
  }
}
