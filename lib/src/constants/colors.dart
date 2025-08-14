import 'package:flutter/material.dart';

class AppColors {
  // ===== Primary Brand Colors =====
  static const Color primary = Colors.deepPurple; // Vibrant Red-Orange
  static const Color primaryDark = Color(0xFFE64A19); // Darker red-orange
  static const Color primaryLight = Color(0xFFFFAB91); // Light orange tint

  // ===== Secondary Colors =====
  static const Color secondary = Color(
    0xFFFFC107,
  ); // Amber (good for highlights)
  static const Color secondaryDark = Color(0xFFFFA000);
  static const Color secondaryLight = Color(0xFFFFECB3);

  // ===== Status Colors =====
  static const Color success = Color(0xFF4CAF50); // Green for correct answers
  static const Color error = Color(0xFFF44336); // Red for wrong answers
  static const Color warning = Color(0xFFFF9800); // Orange for warnings

  // ===== Backgrounds =====
  static const Color backgroundLight = Color(0xFFFDFDFD); // Light background
  static const Color backgroundDark = Color(0xFF121212); // Dark mode background
  static const Color cardLight = Color(0xFFFFFFFF); // Card in light mode
  static const Color cardDark = Color(0xFF1E1E1E);
  static const Color darkpurple = Colors.deepPurpleAccent; // Card in dark mode

  // ===== Text Colors =====
  static const Color textPrimaryLight = Color(
    0xFF212121,
  ); // Dark gray for light mode
  static const Color textSecondaryLight = Color(0xFF757575); // Medium gray
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // White for dark mode
  static const Color textSecondaryDark = Color(0xFFBDBDBD); // Light gray

  // ===== Other UI Colors =====
  static const Color divider = Color(0xFFBDBDBD);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color hint = Color(0xFF9E9E9E);

  // ===== Quiz Specific =====
  static const Color easy = Color(0xFF4CAF50); // Green
  static const Color medium = Color(0xFFFFC107); // Amber
  static const Color hard = Color(0xFFF44336); // Red

  // ===== Card colors =====
  static const Color bluecard = Colors.lightBlueAccent;
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}
