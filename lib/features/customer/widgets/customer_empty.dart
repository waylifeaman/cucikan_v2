import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class CustomerEmpty extends StatelessWidget {
  const CustomerEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.people_outline,
                size: 42,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 20),

            Text("Belum Ada Customer", style: AppTextStyles.heading3),

            const SizedBox(height: 10),

            Text(
              "Tambahkan customer pertama untuk mulai mencatat transaksi.",
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
