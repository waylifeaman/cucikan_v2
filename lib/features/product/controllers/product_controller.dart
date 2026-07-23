import 'dart:async';

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends ChangeNotifier {
  ProductController();

  final ProductService _service = ProductService.instance;

  //--------------------------------------------------
  // FORM
  //--------------------------------------------------

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  //--------------------------------------------------
  // STATE
  //--------------------------------------------------

  bool isLoading = false;

  String selectedUnit = "kg";

  bool isActive = true;

  List<ProductModel> products = [];

  List<ProductModel> filteredProducts = [];

  final searchController = TextEditingController();

  StreamSubscription<List<ProductModel>>? _subscription;

  //--------------------------------------------------
  // INIT
  //--------------------------------------------------

  void loadProducts() {
    _subscription?.cancel();

    _subscription = _service.streamProducts().listen((data) {
      products = data;

      searchProduct(searchController.text);

      notifyListeners();
    });
  }

  //--------------------------------------------------
  // SEARCH
  //--------------------------------------------------

  void searchProduct(String keyword) {
    if (keyword.trim().isEmpty) {
      filteredProducts = List.from(products);
    } else {
      filteredProducts = products.where((product) {
        return product.name.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();

    filteredProducts = List.from(products);

    notifyListeners();
  }

  //--------------------------------------------------
  // FORM
  //--------------------------------------------------

  void clearForm() {
    nameController.clear();

    descriptionController.clear();

    priceController.clear();

    selectedUnit = "kg";

    isActive = true;

    notifyListeners();
  }

  void setForm(ProductModel product) {
    nameController.text = product.name;

    descriptionController.text = product.description ?? "";

    priceController.text = product.price.toString();

    selectedUnit = product.unit;

    isActive = product.isActive;

    notifyListeners();
  }

  void changeUnit(String unit) {
    selectedUnit = unit;

    notifyListeners();
  }

  void changeStatus(bool value) {
    isActive = value;

    notifyListeners();
  }

  //--------------------------------------------------
  // CREATE
  //--------------------------------------------------

  Future<void> createProduct(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading = true;
      notifyListeners();

      final product = ProductModel(
        id: "",
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        price: double.parse(priceController.text),
        unit: selectedUnit,
        isActive: isActive,
      );

      await _service.createProduct(product);

      clearForm();

      if (context.mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Layanan berhasil ditambahkan")),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //--------------------------------------------------
  // UPDATE
  //--------------------------------------------------

  Future<void> updateProduct(
    BuildContext context,
    ProductModel oldProduct,
  ) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading = true;
      notifyListeners();

      final product = oldProduct.copyWith(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        price: double.parse(priceController.text),
        unit: selectedUnit,
        isActive: isActive,
      );

      await _service.updateProduct(product);

      clearForm();

      if (context.mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Layanan berhasil diperbarui")),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //--------------------------------------------------
  // DELETE
  //--------------------------------------------------

  Future<void> deleteProduct(BuildContext context, String id) async {
    await _service.deleteProduct(id);

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Layanan berhasil dihapus")));
    }
  }

  Future<void> confirmDelete(BuildContext context, ProductModel product) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text("Hapus Layanan"),
        content: Text("Yakin ingin menghapus '${product.name}' ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("Batal"),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );

    if (result == true) {
      await deleteProduct(context, product.id);
    }
  }
  //--------------------------------------------------
  // DISPOSE
  //--------------------------------------------------

  @override
  void dispose() {
    _subscription?.cancel();

    nameController.dispose();

    descriptionController.dispose();

    priceController.dispose();

    searchController.dispose();

    super.dispose();
  }
}
