import 'package:flutter/material.dart';

import '../models/customer_model.dart';
import '../services/customer_service.dart';

class CustomerController extends ChangeNotifier {
  CustomerController();

  //==================================================
  // Service
  //==================================================

  final CustomerService _customerService = CustomerService.instance;

  //==================================================
  // TextEditingController
  //==================================================

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final searchController = TextEditingController();

  void search(String value) {
    notifyListeners();
  }
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
  // Stream Customer
  //==================================================

  Stream<List<CustomerModel>> get customers =>
      _customerService.streamCustomers();

  //==================================================
  // Loading
  //==================================================

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //==================================================
  // Clear Form
  //==================================================

  void clearForm() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
  }

  //==================================================
  // Fill Form (Edit)
  //==================================================

  void fillForm(CustomerModel customer) {
    nameController.text = customer.name;
    phoneController.text = customer.phone;
    addressController.text = customer.address;
  }

  //==================================================
  // Create Customer
  //==================================================

  Future<void> createCustomer() async {
    if (!formKey.currentState!.validate()) return;

    setLoading(true);

    try {
      final customer = CustomerModel.empty().copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
      );

      await _customerService.createCustomer(customer);

      clearForm();
    } finally {
      setLoading(false);
    }
  }

  //==================================================
  // Update Customer
  //==================================================

  Future<void> updateCustomer(CustomerModel customer) async {
    if (!formKey.currentState!.validate()) return;

    setLoading(true);

    try {
      final updatedCustomer = customer.copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
      );

      await _customerService.updateCustomer(updatedCustomer);

      clearForm();
    } finally {
      setLoading(false);
    }
  }

  //==================================================
  // Delete Customer
  //==================================================

  Future<void> deleteCustomer(String customerId) async {
    await _customerService.deleteCustomer(customerId);
  }

  //==================================================
  // Dispose
  //==================================================

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }
}
