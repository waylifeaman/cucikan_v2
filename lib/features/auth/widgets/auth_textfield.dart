import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_spacing.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final VoidCallback? onToggleObscure;
  final bool showToggleObscure;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.onToggleObscure,
    this.showToggleObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.body),

          const SizedBox(height: 8),

          TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            textInputAction: textInputAction,
            cursorColor: AppColors.primary,

            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodySmall,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,

              suffixIcon: showToggleObscure
                  ? IconButton(
                      onPressed: onToggleObscure,
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.textSecondary,
                      ),
                    )
                  : null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
