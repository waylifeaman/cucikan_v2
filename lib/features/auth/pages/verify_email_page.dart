import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../features/auth/controllers/verify_email_controller.dart';
import '../widgets/auth_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late final VerifyEmailController controller;

  @override
  void initState() {
    super.initState();

    controller = VerifyEmailController();

    controller.addListener(() {
      if (!mounted) return;

      if (controller.isVerified) {
        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (_) => false);
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email ?? "-";

    return Scaffold(
      appBar: AppBar(title: const Text("Verifikasi Email"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const Icon(
                  Icons.mark_email_read_outlined,
                  size: 110,
                  color: AppColors.primary,
                ),

                const SizedBox(height: 24),

                Text(
                  "Periksa Email Anda",
                  style: AppTextStyles.heading2,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                Text(
                  "Kami telah mengirim email verifikasi ke:",
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                Text(
                  email,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Silakan buka email tersebut kemudian klik tombol Verifikasi Email.\n\nSetelah berhasil, aplikasi akan otomatis melanjutkan.",
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 35),

                AuthButton(
                  text: controller.loading
                      ? "Memeriksa..."
                      : "Saya Sudah Verifikasi",
                  onPressed: controller.loading
                      ? null
                      : () async {
                          final verified = await controller.checkNow();

                          if (!verified && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email belum diverifikasi."),
                              ),
                            );
                          }
                        },
                ),

                const SizedBox(height: 20),

                controller.countdown == 0
                    ? TextButton(
                        onPressed: () async {
                          await controller.resendEmail();

                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Email verifikasi berhasil dikirim ulang.",
                              ),
                            ),
                          );
                        },
                        child: const Text("Kirim Ulang Email"),
                      )
                    : Text(
                        "Kirim ulang dalam ${controller.countdown} detik",
                        style: AppTextStyles.bodySmall,
                      ),

                const SizedBox(height: 30),

                TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    if (!context.mounted) return;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (_) => false,
                    );
                  },
                  child: const Text("Ganti Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
