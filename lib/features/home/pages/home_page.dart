import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_spacing.dart';
import '../controllers/home_controller.dart';
import '../widgets/dashboard_empty_transaction.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_section_title.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/income_card.dart';
import '../widgets/quick_action_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<HomeController>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    if (controller.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(
                greeting: controller.greeting,
                ownerName: controller.ownerName,
                outletName: controller.outletName,
              ),

              const SizedBox(height: AppSpacing.xl),

              const QuickActionMenu(),
              const SizedBox(height: AppSpacing.xl),
              const IncomeCard(),

              const SizedBox(height: AppSpacing.xxl),

              const DashboardSectionTitle(title: "Transaksi Terbaru"),

              const SizedBox(height: AppSpacing.md),

              const DashboardEmptyTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
