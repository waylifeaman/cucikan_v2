import 'package:flutter/material.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/session_service.dart';

class SplashController extends ChangeNotifier {
  SplashController();

  final AuthService _authService = AuthService.instance;

  Future<String> checkSession() async {
    // Splash tampil selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // Belum login
    if (!_authService.isLoggedIn) {
      return '/welcome';
    }

    // Refresh data user
    await _authService.reloadUser();

    // Belum verifikasi email
    if (!_authService.isEmailVerified) {
      return '/verify-email';
    }

    // Cek outlet terakhir
    final outletId = await SessionService.getOutletId();

    if (outletId == null) {
      return '/login';
    }

    // Semua aman
    return '/main';
  }
}
