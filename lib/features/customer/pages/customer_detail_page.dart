import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_spacing.dart';
import '../controllers/customer_detail_controller.dart';
import '../models/customer_model.dart';
import '../widgets/customer_detail_header.dart';
import '../widgets/customer_history_list.dart';
import '../widgets/customer_statistics.dart';
import '../widgets/customer_quick_action.dart';

class CustomerDetailPage extends StatelessWidget {
  final CustomerModel customer;

  const CustomerDetailPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CustomerDetailController(customer),
      child: const _CustomerDetailView(),
    );
  }
}

class _CustomerDetailView extends StatelessWidget {
  const _CustomerDetailView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CustomerDetailController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Customer")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomerDetailHeader(customer: controller.customer),

            const SizedBox(height: AppSpacing.xl),

            CustomerStatistics(
              totalOrder: controller.totalOrder,
              totalSpent: controller.totalSpent,
              processingOrder: controller.processingOrder,
              completedOrder: controller.completedOrder,
            ),

            const SizedBox(height: AppSpacing.xl),

            CustomerQuickAction(customer: controller.customer),

            const SizedBox(height: AppSpacing.xl),

            CustomerHistoryList(orders: controller.orders),
          ],
        ),
      ),
    );
  }
}
