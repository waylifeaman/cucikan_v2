import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pendapatan Hari Ini",
            style: AppTextStyles.body.copyWith(color: Colors.white70),
          ),

          const SizedBox(height: 12),

          Text(
            "Rp0",
            style: AppTextStyles.heading1.copyWith(
              color: Colors.white,
              fontSize: 34,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Belum ada transaksi hari ini",
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
