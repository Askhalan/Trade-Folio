import 'package:flutter/material.dart';

class JColor {
  JColor._();

  // App Basic Colors
  static const Color primary = Color(0xFF06C25E);
  static const Color secondary = Color(0xFFFFA115);
  static const Color accent = Color(0xFF4F0618);

  // Error and validation colors
  static const Color error = Color.fromARGB(255, 255, 77, 77);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);

  // Icon Color
  static const Color icon = Color(0xFF797979);

  static const Color iconAccent = Color(0xFFFFFFFF);
  static const Color info = Color(0xFF1976D2);

  //Netural Shades
  static const Color black = Color(0xFF232323);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xFF4F4F4F);

  //text colours
  static const Color textPrimary = Color.fromARGB(255, 24, 25, 32);
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);

  //BOX-Shadow
  static BoxShadow tileShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 2,
    offset: const Offset(0, 1),
  );
}
