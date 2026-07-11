import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../validators/auth_validator.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/auth_button.dart';
import '../controllers/login_controller.dart';
import 'register_page.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                const AppLogo(size: 90),

                const SizedBox(height: 20),

                Text("Selamat Datang", style: AppTextStyles.heading2),

                const SizedBox(height: 8),

                Text(
                  "Silakan login untuk melanjutkan",
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: AppSpacing.xxl),
                AuthTextField(
                  controller: controller.emailController,
                  label: 'Email',
                  hint: 'Masukkan email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidator.validateEmail,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  controller: controller.passwordController,
                  label: 'Password',
                  hint: 'Masukkan password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: controller.obscurePassword,
                  validator: AuthValidator.validatePassword,
                  showToggleObscure: true,
                  onToggleObscure: controller.togglePasswordVisibility,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // nanti kita buat fitur reset password
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                    child: const Text("Lupa Password"),
                  ),
                ),

                const SizedBox(height: 24),
                AuthButton(
                  text: 'Masuk',
                  isLoading: controller.isLoading,
                  icon: Icons.login,
                  onPressed: () async {
                    await controller.login(context);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("Daftar"),
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
