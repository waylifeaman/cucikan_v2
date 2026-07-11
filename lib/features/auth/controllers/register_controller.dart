import 'package:flutter/material.dart';

import '../services/register_service.dart';

class RegisterController extends ChangeNotifier {
  RegisterController();

  final RegisterService _registerService = RegisterService.instance;

  // ============================
  // Form
  // ============================

  final formKey = GlobalKey<FormState>();

  // ============================
  // Text Controllers
  // ============================

  final ownerNameController = TextEditingController();

  final outletNameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  // ============================
  // State
  // ============================

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  bool _obscureConfirmPassword = true;

  bool get obscureConfirmPassword => _obscureConfirmPassword;

  // ============================
  // Toggle Password
  // ============================
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }
  // ============================
  // Register
  // ============================

  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      await _registerService.register(
        ownerName: ownerNameController.text.trim(),
        outletName: outletNameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registrasi berhasil")));

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

  // ============================
  // Dispose
  // ============================

  @override
  void dispose() {
    ownerNameController.dispose();
    outletNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
