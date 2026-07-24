import 'package:flutter/material.dart';

import '../models/customer_model.dart';

class CustomerDetailController extends ChangeNotifier {
  CustomerDetailController(this.customer) {
    loadData();
  }

  //==================================================
  // Customer
  //==================================================

  final CustomerModel customer;

  //==================================================
  // Loading
  //==================================================

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //==================================================
  // Statistics
  //==================================================

  int _totalOrder = 0;
  int _processingOrder = 0;
  int _completedOrder = 0;
  double _totalSpent = 0;

  int get totalOrder => _totalOrder;

  int get processingOrder => _processingOrder;

  int get completedOrder => _completedOrder;

  double get totalSpent => _totalSpent;

  //==================================================
  // Order History
  //==================================================

  final List<dynamic> _orders = [];

  List<dynamic> get orders => _orders;

  //==================================================
  // Load Data
  //==================================================

  Future<void> loadData() async {
    _setLoading(true);

    try {
      await loadStatistics();
      await loadHistory();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  //==================================================
  // Load Statistics
  //==================================================

  Future<void> loadStatistics() async {
    // TODO:
    // Hitung statistik dari collection orders
    //
    // totalOrder
    // processingOrder
    // completedOrder
    // totalSpent
  }

  //==================================================
  // Load History
  //==================================================

  Future<void> loadHistory() async {
    // TODO:
    // Ambil seluruh order customer
    // Urutkan berdasarkan created_at desc
  }

  //==================================================
  // Helper
  //==================================================

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
