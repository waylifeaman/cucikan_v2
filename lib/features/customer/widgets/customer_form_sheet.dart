import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../controllers/customer_controller.dart';

class CustomerFormSheet extends StatelessWidget {
  final CustomerController controller;

  const CustomerFormSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
              Text("Tambah Customer", style: AppTextStyles.heading3),

              const SizedBox(height: AppSpacing.xl),

              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: "Nama Customer"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama wajib diisi";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Nomor HP"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nomor HP wajib diisi";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: controller.addressController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Alamat"),
              ),

              const SizedBox(height: AppSpacing.xl),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isLoading
                      ? null
                      : () async {
                          await controller.createCustomer();

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                  child: controller.isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Simpan"),
                ),
              ),

              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
