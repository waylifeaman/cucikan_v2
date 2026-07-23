import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_laundry_service_outlined,
                size: 55,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              "Belum Ada Layanan",
              style: AppTextStyles.heading3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "Tambahkan layanan laundry pertama\nagar pelanggan dapat membuat pesanan.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
