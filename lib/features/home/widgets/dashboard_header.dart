import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class DashboardHeader extends StatelessWidget {
  final String greeting;
  final String ownerName;
  final String outletName;

  const DashboardHeader({
    super.key,
    required this.greeting,
    required this.ownerName,
    required this.outletName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
              ),

              const SizedBox(height: 4),

              Text(ownerName, style: AppTextStyles.heading1),

              const SizedBox(height: 4),

              Text(outletName, style: AppTextStyles.body),
            ],
          ),
        ),

        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.12),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: AppColors.primary),
        ),
      ],
    );
  }
}
