import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),

          const SizedBox(width: AppSpacing.md),

          Expanded(child: Text(title, style: AppTextStyles.body)),
        ],
      ),
    );
  }
}
