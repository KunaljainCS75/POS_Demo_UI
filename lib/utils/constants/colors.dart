import 'package:flutter/material.dart';

class KColors{
  KColors._(); /// NOT MANDATORY

  // APP BASIC COLORS
  static const Color primary = Color(0xFF0080F6); /// "0xFF" = HexColor Code domination flag in dart;
  static const Color secondary = Color(0xFF00B2EB);
  static const Color tertiary = Color(0xFFb0c7ff);

  // TEXT COLORS
  static const Color textPrimary = Color(0xFF212325);
  static const Color textSecondary = Color(0xFF737D93);
  static const Color textWhite = Colors.white;

  // BACKGROUND COLORS
  static const Color lightGreen = Color(0xFFECF5EE);
  static const Color lightBlue = Color(0xFFEAEBFA);
  static const Color lightOrange = Color(0xFFFFECDD);

  // BACKGROUND CONTAINER COLORS
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = KColors.white.withOpacity(0.1);

  // BUTTON COLORS
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // BORDER COLORS
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // ERROR & VALIDATION COLORS
  static const Color loss = Color(0xFFD32F2F);
  static const Color profit = Color(0xFF458F5A);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // NEUTRAL SHADES
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // GRADIENT COLORS
  static const Gradient linearGradient = LinearGradient(colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
    Color(0xfffad0c4)
  ]);
}