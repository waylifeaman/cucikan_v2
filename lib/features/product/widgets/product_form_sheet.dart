import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductFormSheet extends StatelessWidget {
  final ProductModel? product;

  const ProductFormSheet({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductController>();

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 55,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text(
                product == null ? "Tambah Layanan" : "Edit Layanan",
                style: AppTextStyles.heading3,
              ),

              const SizedBox(height: AppSpacing.xl),

              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Layanan",
                  prefixIcon: Icon(Icons.local_laundry_service),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama layanan wajib diisi";
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppSpacing.md),

              TextFormField(
                controller: controller.descriptionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  prefixIcon: Icon(Icons.description),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              TextFormField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Harga",
                  prefixIcon: Icon(Icons.payments),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga wajib diisi";
                  }

                  if (double.tryParse(value) == null) {
                    return "Harga tidak valid";
                  }

                  return null;
                },
              ),

              const SizedBox(height: AppSpacing.md),

              Consumer<ProductController>(
                builder: (_, controller, __) {
                  return DropdownButtonFormField<String>(
                    value: controller.selectedUnit,
                    decoration: const InputDecoration(
                      labelText: "Satuan",
                      prefixIcon: Icon(Icons.straighten),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "kg",
                        child: Text("Kilogram (Kg)"),
                      ),
                      DropdownMenuItem(
                        value: "pcs",
                        child: Text("Pieces (Pcs)"),
                      ),
                      DropdownMenuItem(value: "pasang", child: Text("Pasang")),
                      DropdownMenuItem(value: "item", child: Text("Item")),
                    ],
                    onChanged: (value) {
                      controller.selectedUnit = value!;
                      controller.notifyListeners();
                    },
                  );
                },
              ),

              const SizedBox(height: AppSpacing.md),

              Consumer<ProductController>(
                builder: (_, controller, __) {
                  return SwitchListTile(
                    value: controller.isActive,
                    activeColor: AppColors.primary,
                    title: const Text("Layanan Aktif"),
                    onChanged: (value) {
                      controller.isActive = value;
                      controller.notifyListeners();
                    },
                  );
                },
              ),

              const SizedBox(height: AppSpacing.lg),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: controller.isLoading
                      ? null
                      : () {
                          if (product == null) {
                            controller.createProduct(context);
                          } else {
                            controller.updateProduct(context, product!);
                          }
                        },
                  child: controller.isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          product == null ? "Simpan" : "Update",
                          style: AppTextStyles.button,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
