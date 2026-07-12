import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/session_service.dart';

class DashboardController extends ChangeNotifier {
  DashboardController() {
    loadSession();
  }

  final AuthService _authService = AuthService.instance;
  User? get currentUser => _authService.currentUser;
  String? outletId;
  String? role;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> loadSession() async {
    outletId = await SessionService.getOutletId();
    role = await SessionService.getRole();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    await AuthService.instance.signOut();

    await SessionService.clear();

    Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
  }
}
