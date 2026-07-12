import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_logo.dart';
import '../controllers/forgot_password_controller.dart';
import '../validators/auth_validator.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordController(),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),

                const Center(child: AppLogo(size: 120)),

                const SizedBox(height: AppSpacing.xl),

                Text(
                  "Lupa Password?",
                  style: AppTextStyles.heading2,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSpacing.md),

                Text(
                  "Masukkan email yang telah terdaftar.\nKami akan mengirimkan link untuk mengatur ulang password.",
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSpacing.xxl),

                AuthTextField(
                  controller: controller.emailController,
                  label: "Email",
                  hint: "Masukkan email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidator.validateEmail,
                ),

                const SizedBox(height: AppSpacing.xxl),

                AuthButton(
                  text: "Kirim Link Reset",
                  icon: Icons.send,
                  isLoading: controller.isLoading,
                  onPressed: () async {
                    await controller.sendPasswordReset(context);
                  },
                ),

                const SizedBox(height: AppSpacing.lg),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kembali ke Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
