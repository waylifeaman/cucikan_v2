import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../models/customer_model.dart';

class CustomerQuickAction extends StatelessWidget {
  final CustomerModel customer;

  const CustomerQuickAction({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quick Action", style: AppTextStyles.heading3),

        const SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  // TODO: Buat Order
                },
                icon: const Icon(Icons.add),
                label: const Text("Order"),
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Edit Customer
                },
                icon: const Icon(Icons.edit),
                label: const Text("Edit"),
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Hapus Customer
                },
                icon: const Icon(Icons.delete),
                label: const Text("Hapus"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
