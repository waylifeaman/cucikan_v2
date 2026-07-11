import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/services/session_service.dart';

class SplashController extends ChangeNotifier {
  SplashController();

  Future<String> checkSession() async {
    // Delay agar logo terlihat
    await Future.delayed(const Duration(seconds: 2));

    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return '/login';
    }

    final outletId = await SessionService.getOutletId();

    if (outletId == null) {
      return '/login';
    }

    return '/dashboard';
  }
}
