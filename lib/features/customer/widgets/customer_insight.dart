import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';

class CustomerInsight extends StatelessWidget {
  final DateTime? memberSince;
  final String favoriteService;
  final String lastOrder;
  final String averageOrder;
  final double totalWeight;

  const CustomerInsight({
    super.key,
    this.memberSince,
    required this.favoriteService,
    required this.lastOrder,
    required this.averageOrder,
    required this.totalWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Customer Insight", style: AppTextStyles.heading3),

        const SizedBox(height: AppSpacing.md),

        _InsightTile(
          icon: Icons.calendar_today_outlined,
          title: "Member Sejak",
          value: memberSince == null
              ? "-"
              : "${memberSince!.day}/${memberSince!.month}/${memberSince!.year}",
        ),

        _InsightTile(
          icon: Icons.history,
          title: "Laundry Terakhir",
          value: lastOrder,
        ),

        _InsightTile(
          icon: Icons.repeat,
          title: "Rata-rata Order",
          value: averageOrder,
        ),

        _InsightTile(
          icon: Icons.local_laundry_service,
          title: "Layanan Favorit",
          value: favoriteService,
        ),

        _InsightTile(
          icon: Icons.scale,
          title: "Total Berat",
          value: "${totalWeight.toStringAsFixed(1)} Kg",
        ),
      ],
    );
  }
}

class _InsightTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InsightTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
