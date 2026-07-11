import 'package:flutter/material.dart';
import 'features/splash/pages/splash_page.dart';
import 'core/theme/app_theme.dart';
import 'features/welcome/pages/welcome_page.dart';
import 'features/auth/pages/login_page.dart';
import 'features/auth/pages/register_page.dart';
import 'features/dashboard/pages/dashboard_page.dart';

class CucikanApp extends StatelessWidget {
  const CucikanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cucikan',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      initialRoute: '/',

      routes: {
        '/': (_) => const SplashPage(),
        '/welcome': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),

        // Tambahkan di sini
        '/dashboard': (_) => const DashboardPage(),
      },
    );
  }
}
