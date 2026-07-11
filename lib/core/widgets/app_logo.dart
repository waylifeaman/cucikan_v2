import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLogo({super.key, this.size = 120, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo2.png',
      width: size,
      height: size,
      color: color,
      fit: BoxFit.contain,
    );
  }
}
