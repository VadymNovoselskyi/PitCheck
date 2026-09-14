import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF11151C);
  static const Color card = Color(0xFF1D232D);
  static const Color primary = Color(0xFF00AAFF);
  static const Color accent = Color(0xFFFF4800);
  static const Color text = Color(0xFFF1F4F8);
  static const Color secondaryText = Color(0xFFB5BFCE);
}

const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        secondary: AppColors.accent,
        onSecondary: AppColors.background,
        surface: AppColors.background,
        onSurface: AppColors.text,
        onSurfaceVariant: AppColors.secondaryText,
        surfaceContainerLow: AppColors.card,
      ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, height: 1.5),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.text,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: AppColors.text,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ),
  cardTheme: const CardThemeData(
    color: AppColors.card,
    elevation: 0,
    shape: _roundedShape,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    showDragHandle: true,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.card,
    shape: _roundedShape,
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: AppColors.card,
    indicatorColor: AppColors.primary,
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.card,
    selectedColor: AppColors.primary,
    labelStyle: const TextStyle(color: AppColors.text),
    secondaryLabelStyle: const TextStyle(color: AppColors.background),
    shape: const StadiumBorder(),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.secondaryText,
    textColor: AppColors.text,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: AppColors.secondaryText,
    collapsedIconColor: AppColors.secondaryText,
    textColor: AppColors.text,
    collapsedTextColor: AppColors.text,
    childrenPadding: EdgeInsets.only(left: 16),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.secondaryText,
    space: 1,
    thickness: 1,
  ),
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(AppColors.card),
    textStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.text)),
    hintStyle: WidgetStatePropertyAll(
      TextStyle(color: AppColors.secondaryText),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.card,
    contentTextStyle: TextStyle(color: AppColors.text),
    actionTextColor: AppColors.primary,
    behavior: SnackBarBehavior.floating,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.background,
    shape: CircleBorder(),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(48, 48),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: _roundedShape,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(48, 48),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: _roundedShape,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.card,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    hintStyle: TextStyle(color: AppColors.secondaryText),
  ),
);
