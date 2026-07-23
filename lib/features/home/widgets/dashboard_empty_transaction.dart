import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class DashboardEmptyTransaction extends StatelessWidget {
  const DashboardEmptyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.10),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_laundry_service_rounded,
              size: 42,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 18),

          Text("Belum Ada Transaksi", style: AppTextStyles.heading2),

          const SizedBox(height: 8),

          Text(
            "Pesanan laundry yang masuk hari ini akan muncul di sini.",
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
