import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_logo.dart';

import '../controllers/register_controller.dart';
import '../validators/auth_validator.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterController(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xl),

                const Center(child: AppLogo(size: 90)),

                const SizedBox(height: AppSpacing.lg),

                Center(
                  child: Text("Buat Akun Baru", style: AppTextStyles.heading2),
                ),

                const SizedBox(height: AppSpacing.sm),

                Center(
                  child: Text(
                    "Mulai kelola laundry Anda\nbersama Cucikan",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body,
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),
                AuthTextField(
                  controller: controller.ownerNameController,
                  label: "Nama Pemilik",
                  hint: "Masukkan nama pemilik",
                  prefixIcon: Icons.person_outline,
                  validator: AuthValidator.validateName,
                ),
                AuthTextField(
                  controller: controller.outletNameController,
                  label: "Nama Outlet",
                  hint: "Masukkan nama outlet",
                  prefixIcon: Icons.store_outlined,
                  validator: AuthValidator.validateOutletName,
                ),
                AuthTextField(
                  controller: controller.phoneController,
                  label: "Nomor HP",
                  hint: "08xxxxxxxxxx",
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  validator: AuthValidator.validatePhone,
                ),
                AuthTextField(
                  controller: controller.emailController,
                  label: "Email",
                  hint: "Masukkan email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: AuthValidator.validateEmail,
                ),
                AuthTextField(
                  controller: controller.passwordController,
                  label: "Password",
                  hint: "Masukkan password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: controller.obscurePassword,
                  validator: AuthValidator.validatePassword,
                  showToggleObscure: true,
                  onToggleObscure: controller.togglePasswordVisibility,
                ),
                AuthTextField(
                  controller: controller.confirmPasswordController,
                  label: "Konfirmasi Password",
                  hint: "Ulangi password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: controller.obscureConfirmPassword,
                  validator: (value) => AuthValidator.validateConfirmPassword(
                    value,
                    controller.passwordController.text,
                  ),
                  showToggleObscure: true,
                  onToggleObscure: controller.toggleConfirmPasswordVisibility,
                ),
                const SizedBox(height: AppSpacing.lg),

                AuthButton(
                  text: "Daftar",
                  icon: Icons.person_add_alt_1,
                  isLoading: controller.isLoading,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    await controller.register(context);
                  },
                ),
                const SizedBox(height: AppSpacing.lg),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Masuk"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
