import 'package:flutter/material.dart';

import '../services/forgot_password_service.dart';

class ForgotPasswordController extends ChangeNotifier {
  ForgotPasswordController();

  final ForgotPasswordService _service = ForgotPasswordService.instance;

  //==========================
  // Form
  //==========================

  final formKey = GlobalKey<FormState>();

  //==========================
  // Controller
  //==========================

  final emailController = TextEditingController();

  //==========================
  // State
  //==========================

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //==========================
  // Reset Password
  //==========================

  Future<void> sendPasswordReset(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      await _service.sendPasswordResetEmail(email: emailController.text.trim());

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Link reset password berhasil dikirim ke email Anda."),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //==========================
  // Dispose
  //==========================

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
