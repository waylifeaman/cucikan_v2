import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true),

      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selamat Datang 👋", style: AppTextStyles.heading2),

                  const SizedBox(height: AppSpacing.lg),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("UID"),

                          const SizedBox(height: 4),

                          Text(controller.currentUser?.uid ?? "-"),
                          const Divider(),

                          const Text("Email"),

                          const SizedBox(height: 4),

                          Text(controller.currentUser?.email ?? "-"),
                          const Divider(),

                          const Text("Outlet ID"),

                          const SizedBox(height: 4),

                          Text(controller.outletId ?? "-"),

                          const Divider(),

                          const Text("Role"),

                          const SizedBox(height: 4),

                          Text(controller.role ?? "-"),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.logout(context);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
