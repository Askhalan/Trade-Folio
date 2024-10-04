import 'package:flutter/material.dart';

class JColor {
  JColor._();

  // App Basic Colors
  static const Color primary = Color(0xFF435314);
  static const Color secondary = Color(0xFF464c40);
  static const Color accent = Color(0xFFc1ef02);
  static const Color background = Color.fromARGB(255, 14, 22, 5);

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
  static const Color softGrey = Color(0xFFdcdcdd);
  static const Color grey = Color(0xFFa8a9aa);
  static const Color darkGrey = Color(0xFF787b78);
  static const Color darkerGrey = Color(0xFF4f5346);

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

  //Gradient

  static Gradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0.1),
      Colors.white.withOpacity(0.3),
    ],
  );
  static Gradient secondryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      // Colors.white.withOpacity(0.1),
      Colors.white.withOpacity(0.5),
    ],
  );
}
