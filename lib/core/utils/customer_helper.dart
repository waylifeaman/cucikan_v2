import 'package:flutter/material.dart';

class CustomerHelper {
  CustomerHelper._();

  static String getInitial(String name) {
    final words = name.trim().split(' ');

    if (words.isEmpty) return '?';

    if (words.length == 1) {
      return words.first.substring(0, 1).toUpperCase();
    }

    return (words[0][0] + words[1][0]).toUpperCase();
  }

  static Color getAvatarColor(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.cyan,
    ];

    return colors[name.hashCode.abs() % colors.length];
  }
}
