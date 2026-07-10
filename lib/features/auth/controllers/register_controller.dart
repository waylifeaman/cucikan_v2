import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  //==================================================
  // Constructor
  //==================================================

  RegisterController();

  //==================================================
  // Text Editing Controller
  //==================================================

  final nameController = TextEditingController();

  final outletNameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  //==================================================
  // Form Key
  //==================================================

  final formKey = GlobalKey<FormState>();

  //==================================================
  // Variables
  //==================================================

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //==================================================
  // Methods
  //==================================================

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> register() async {}

  //==================================================
  // Dispose
  //==================================================

  @override
  void dispose() {
    nameController.dispose();
    outletNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
