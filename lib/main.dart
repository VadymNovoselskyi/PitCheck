import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  runApp(
    ProviderScope(
      overrides: [
        themeModeStoreProvider.overrideWithValue(themeModeStore),
        initialThemeModeProvider.overrideWithValue(initialThemeMode),
      ],
      child: const ScrutApp(),
    ),
  );
}

class ScrutApp extends ConsumerWidget {
  const ScrutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'PitCheck',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeModeControllerProvider),
      routerConfig: router,
    );
  }
}
