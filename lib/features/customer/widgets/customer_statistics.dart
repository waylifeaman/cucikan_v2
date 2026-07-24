import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/currency_formatter.dart';

class CustomerStatistics extends StatelessWidget {
  final int totalOrder;
  final double totalSpent;
  final int processingOrder;
  final int completedOrder;

  const CustomerStatistics({
    super.key,
    required this.totalOrder,
    required this.totalSpent,
    required this.processingOrder,
    required this.completedOrder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: AppSpacing.md,
      mainAxisSpacing: AppSpacing.md,
      childAspectRatio: 0.9,
      children: [
        _StatisticCard(
          title: "Total Order",
          value: totalOrder.toString(),
          icon: Icons.receipt_long_rounded,
          color: Colors.blue,
        ),

        _StatisticCard(
          title: "Total Belanja",
          value: CurrencyFormatter.format(totalSpent),
          icon: Icons.payments_rounded,
          color: Colors.green,
        ),

        _StatisticCard(
          title: "Diproses",
          value: processingOrder.toString(),
          icon: Icons.hourglass_top_rounded,
          color: Colors.orange,
        ),

        _StatisticCard(
          title: "Selesai",
          value: completedOrder.toString(),
          icon: Icons.check_circle_rounded,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(.12),
            child: Icon(icon, color: color),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: AppTextStyles.heading3.copyWith(color: color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
