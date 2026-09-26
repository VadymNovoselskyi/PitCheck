import 'package:flutter/material.dart';

class _AppPalette {
  const _AppPalette({
    required this.background,
    required this.card,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.onAccent,
    required this.text,
    required this.secondaryText,
    required this.divider,
  });

  final Color background;
  final Color card;
  final Color primary;
  final Color onPrimary;
  final Color accent;
  final Color onAccent;
  final Color text;
  final Color secondaryText;
  final Color divider;
}

const _darkPalette = _AppPalette(
  background: Color(0xFF11151C),
  card: Color(0xFF1D232D),
  primary: Color(0xFF00AAFF),
  onPrimary: Color(0xFF11151C),
  accent: Color(0xFFFF4800),
  onAccent: Color(0xFF11151C),
  text: Color(0xFFF1F4F8),
  secondaryText: Color(0xFFB5BFCE),
  divider: Color(0xFF505254),
);

const _lightPalette = _AppPalette(
  background: Color.fromARGB(255, 224, 234, 243),
  card: Color(0xFFFFFFFF),
  primary: Color(0xFF00AAFF),
  onPrimary: Color(0xFF11151C),
  accent: Color(0xFFB54017),
  onAccent: Color(0xFFFFFFFF),
  text: Color(0xFF17212B),
  secondaryText: Color(0xFF536274),
  divider: Color(0xFFD8E0E8),
);

const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

final darkTheme = _buildTheme(Brightness.dark, _darkPalette);
final lightTheme = _buildTheme(Brightness.light, _lightPalette);

ThemeData _buildTheme(Brightness brightness, _AppPalette palette) {
  final colors =
      ColorScheme.fromSeed(
        seedColor: palette.primary,
        brightness: brightness,
      ).copyWith(
        primary: palette.primary,
        onPrimary: palette.onPrimary,
        secondary: palette.accent,
        onSecondary: palette.onAccent,
        surface: palette.background,
        onSurface: palette.text,
        onSurfaceVariant: palette.secondaryText,
        surfaceContainerLow: palette.card,
        outlineVariant: palette.divider,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colors,
    scaffoldBackgroundColor: palette.background,
    textTheme: TextTheme(
      titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: const TextStyle(fontSize: 16, height: 1.5),
      bodyMedium: const TextStyle(fontSize: 14, height: 1.5),
      bodySmall: TextStyle(
        fontSize: 13,
        height: 1.4,
        color: palette.secondaryText,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: palette.background,
      foregroundColor: palette.text,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: palette.text,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    ),
    cardTheme: CardThemeData(
      color: palette.card,
      elevation: 0,
      shape: _roundedShape,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: palette.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      showDragHandle: true,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: palette.card,
      shape: _roundedShape,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: palette.card,
      indicatorColor: colors.primaryContainer,
      labelTextStyle: const WidgetStatePropertyAll(
        TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: palette.card,
      selectedColor: colors.primaryContainer,
      labelStyle: TextStyle(color: palette.text),
      secondaryLabelStyle: TextStyle(color: colors.onPrimaryContainer),
      shape: const StadiumBorder(),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: palette.secondaryText,
      textColor: palette.text,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: palette.secondaryText,
      collapsedIconColor: palette.secondaryText,
      textColor: palette.text,
      collapsedTextColor: palette.text,
      childrenPadding: const EdgeInsets.only(left: 16),
    ),
    dividerTheme: DividerThemeData(
      color: palette.divider,
      space: 1,
      thickness: 1,
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(palette.card),
      textStyle: WidgetStatePropertyAll(TextStyle(color: palette.text)),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(color: palette.secondaryText),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colors.inverseSurface,
      contentTextStyle: TextStyle(color: colors.onInverseSurface),
      actionTextColor: colors.inversePrimary,
      behavior: SnackBarBehavior.floating,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.primaryContainer,
      foregroundColor: colors.onPrimaryContainer,
      shape: const CircleBorder(),
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.card,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      hintStyle: TextStyle(color: palette.secondaryText),
    ),
  );
}
