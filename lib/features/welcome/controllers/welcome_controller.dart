import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_logo.dart';
import '../../auth/widgets/auth_button.dart';
import '../widgets/feature_item.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(),

              const AppLogo(size: 170),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Selamat Datang di Cucikan",
                style: AppTextStyles.heading1,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                "Kelola bisnis laundry dengan lebih mudah, cepat dan modern.",
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.xxl),

              const FeatureItem(
                icon: Icons.local_laundry_service,
                title: "Kelola pesanan laundry dengan mudah",
              ),

              const FeatureItem(
                icon: Icons.people_alt_outlined,
                title: "Data pelanggan tersimpan rapi",
              ),

              const FeatureItem(
                icon: Icons.bar_chart,
                title: "Laporan transaksi otomatis",
              ),

              const Spacer(),

              AuthButton(
                text: "Masuk",
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),

              const SizedBox(height: AppSpacing.md),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                ),
                child: const Text("Daftar"),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text("Versi 2.0.0", style: AppTextStyles.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
