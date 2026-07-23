import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../models/customer_model.dart';

class CustomerTile extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const CustomerTile({
    super.key,
    required this.customer,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(.12),
          child: const Icon(Icons.person, color: AppColors.primary),
        ),

        title: Text(customer.name, style: AppTextStyles.title),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(customer.phone),
            if (customer.address.isNotEmpty)
              Text(
                customer.address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),

        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
