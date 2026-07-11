import 'package:flutter/material.dart';
import 'features/splash/pages/splash_page.dart';

class CucikanApp extends StatelessWidget {
  const CucikanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cucikan',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),

      home: const SplashPage(),
    );
  }
}
