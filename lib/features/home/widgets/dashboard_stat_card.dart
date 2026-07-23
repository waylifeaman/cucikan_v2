import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;

        final iconCircle = cardHeight < 150 ? 40.0 : 50.0;

        final iconSize = cardHeight < 150 ? 20.0 : 26.0;

        final valueStyle = cardHeight < 150
            ? AppTextStyles.heading2
            : AppTextStyles.heading1;

        final titleStyle = AppTextStyles.bodySmall.copyWith(
          color: Colors.grey.shade600,
        );

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconCircle,
                      height: iconCircle,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                        size: iconSize,
                      ),
                    ),

                    const Spacer(),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: valueStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
