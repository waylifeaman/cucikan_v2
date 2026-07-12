import 'dart:async';

import 'package:flutter/material.dart';

import '../services/verify_email_service.dart';

class VerifyEmailController extends ChangeNotifier {
  VerifyEmailController() {
    startChecking();
    startCountdown();
  }

  final VerifyEmailService _service = VerifyEmailService.instance;

  bool _loading = false;

  bool get loading => _loading;

  int _countdown = 60;

  int get countdown => _countdown;

  Timer? _timer;

  Timer? _checkTimer;

  void startCountdown() {
    _timer?.cancel();

    _countdown = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        timer.cancel();
      } else {
        _countdown--;
        notifyListeners();
      }
    });
  }

  Future<void> resendEmail() async {
    if (_countdown > 0) return;

    await _service.resendEmail();

    startCountdown();
  }

  void startChecking() {
    _checkTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await _service.reloadUser();

      if (_service.isVerified) {
        _checkTimer?.cancel();
      }

      notifyListeners();
    });
  }

  Future<bool> checkNow() async {
    _loading = true;

    notifyListeners();

    await _service.reloadUser();

    final verified = _service.isVerified;

    _loading = false;

    notifyListeners();

    return verified;
  }

  bool get isVerified => _service.isVerified;

  @override
  void dispose() {
    _timer?.cancel();

    _checkTimer?.cancel();

    super.dispose();
  }
}
