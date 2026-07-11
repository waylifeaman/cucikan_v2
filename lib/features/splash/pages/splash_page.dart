import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/dot_loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoScale;

  late final Animation<double> _titleOpacity;
  late final Animation<Offset> _titleOffset;

  late final Animation<double> _subtitleOpacity;

  late final Animation<double> _loadingOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    _logoScale = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.elasticOut),
      ),
    );

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.55)),
    );

    _titleOffset = Tween<Offset>(begin: const Offset(0, .4), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 0.55, curve: Curves.easeOut),
          ),
        );

    _subtitleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.45, 0.70)),
    );

    _loadingOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.65, 0.85)),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeTransition(
                        opacity: _logoOpacity,
                        child: ScaleTransition(
                          scale: _logoScale,
                          child: const AppLogo(size: 140, color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      FadeTransition(
                        opacity: _titleOpacity,
                        child: SlideTransition(
                          position: _titleOffset,
                          child: Text(
                            "CUCIKAN",
                            style: AppTextStyles.heading1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.sm),

                      FadeTransition(
                        opacity: _subtitleOpacity,
                        child: Text(
                          "Kelola Laundry Lebih Mudah",
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xxl),

                      FadeTransition(
                        opacity: _loadingOpacity,
                        child: const DotLoading(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "Versi 2.0.0",
                  style: AppTextStyles.caption.copyWith(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
