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
    final size = MediaQuery.of(context).size;

    final logoSize = size.width * 0.38;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLogo(size: logoSize),

                              const SizedBox(height: AppSpacing.xl),

                              Text(
                                "Selamat Datang di Cucikan",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.heading1,
                              ),

                              const SizedBox(height: AppSpacing.md),

                              Text(
                                "Kelola bisnis laundry dengan lebih mudah, cepat dan modern.",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.body,
                              ),

                              const SizedBox(height: AppSpacing.xxl),

                              const FeatureItem(
                                icon: Icons.local_laundry_service,
                                title: "Kelola pesanan laundry dengan mudah",
                              ),

                              const SizedBox(height: AppSpacing.md),

                              const FeatureItem(
                                icon: Icons.people_alt_outlined,
                                title: "Data pelanggan tersimpan rapi",
                              ),

                              const SizedBox(height: AppSpacing.md),

                              const FeatureItem(
                                icon: Icons.bar_chart,
                                title: "Laporan transaksi otomatis",
                              ),
                            ],
                          ),
                        ),

                        AuthButton(
                          text: "Masuk",
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                        ),

                        const SizedBox(height: AppSpacing.md),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/register");
                            },
                            child: const Text("Daftar"),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        Text("Versi 2.0.0", style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
