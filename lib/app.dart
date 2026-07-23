import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';

import 'features/auth/pages/forgot_password_page.dart';
import 'features/auth/pages/login_page.dart';
import 'features/auth/pages/register_page.dart';
import 'features/auth/pages/verify_email_page.dart';

import 'features/home/controllers/home_controller.dart';
import 'features/home/pages/home_page.dart';

import 'features/main/pages/main_page.dart';
import 'features/splash/pages/splash_page.dart';
import 'features/welcome/pages/welcome_page.dart';

import 'features/product/controllers/product_controller.dart';
import 'features/product/pages/product_page.dart';

import 'test_page.dart';

class CucikanApp extends StatelessWidget {
  const CucikanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),

        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Cucikan',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: '/',

        routes: {
          '/': (_) => const SplashPage(),
          '/main': (_) => const MainPage(),
          '/welcome': (_) => const WelcomePage(),
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/verify-email': (_) => const VerifyEmailPage(),
          '/forgot-password': (_) => const ForgotPasswordPage(),
          '/dashboard': (_) => const HomePage(),
          '/products': (_) => const ProductPage(),
          '/test': (_) => const TestPage(),
        },
      ),
    );
  }
}
