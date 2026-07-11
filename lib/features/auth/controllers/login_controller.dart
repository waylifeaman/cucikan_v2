import 'package:flutter/material.dart';

import '../services/login_service.dart';
import '../../../core/services/auth_service.dart';

class LoginController extends ChangeNotifier {
  //==================================================
  // Constructor
  //==================================================

  LoginController();

  //==================================================
  // Form Key
  //==================================================

  final formKey = GlobalKey<FormState>();

  //==================================================
  // Text Editing Controller
  //==================================================

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //==================================================
  // Variables
  //==================================================

  bool _isLoading = false;

  bool _obscurePassword = true;

  //==================================================
  // Service auth
  //==================================================
  final LoginService _loginService = LoginService.instance;
  //==================================================
  // Getters
  //==================================================

  bool get isLoading => _isLoading;

  bool get obscurePassword => _obscurePassword;

  //==================================================
  // Methods
  //==================================================

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _isLoading = true;
    notifyListeners();

    try {
      await _loginService.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!context.mounted) return;

      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  } //==================================================
  // Dispose
  //==================================================

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
