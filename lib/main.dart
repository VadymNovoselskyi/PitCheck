import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pit_check/features/settings/state/text_size_provider.dart';
import 'package:pit_check/features/settings/state/theme_mode_provider.dart';
import 'package:pit_check/router.dart';

import 'firebase_options.dart';
import 'theme.dart';

Future<void> main() async {
  // Firestore setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Dark/light theme setup
  final themeModeStore = ThemeModeStore(SharedPreferencesAsync());
  ThemeMode initialThemeMode;
  try {
    initialThemeMode = await themeModeStore.load();
  } catch (_) {
    initialThemeMode = ThemeMode.dark;
  }

  // Text size setup
  final textSizeStore = TextSizeStore(SharedPreferencesAsync());
  TextSize initialTextSize;
  try {
    initialTextSize = await textSizeStore.load();
  } catch (_) {
    initialTextSize = TextSize.normal;
  }

  runApp(
    ProviderScope(
      overrides: [
        initialThemeModeProvider.overrideWithValue(initialThemeMode),
        initialTextSizeProvider.overrideWithValue(initialTextSize),
      ],
      child: const ScrutApp(),
    ),
  );
}

class ScrutApp extends ConsumerWidget {
  const ScrutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textSize = ref.watch(textSizeControllerProvider);

    return MaterialApp.router(
      title: 'PitCheck',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeModeControllerProvider),
      routerConfig: ref.watch(routerProvider),
      builder: (context, child) {
        // Scale on top of the device text size so system accessibility settings still apply
        final mediaQuery = MediaQuery.of(context);
        // 14 is the body text size.
        final deviceScale = mediaQuery.textScaler.scale(14) / 14;
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(deviceScale * textSize.factor),
          ),
          child: child!,
        );
      },
    );
  }
}
