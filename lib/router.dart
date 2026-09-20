import 'package:go_router/go_router.dart';

import 'package:pit_check/app_shell.dart';

import 'package:pit_check/home_screen.dart';

import 'package:pit_check/features/inspection_sheets/ui/inspection_sheets_screen.dart';
import 'package:pit_check/features/inspection_sheets/ui/inspection_sheet_screen.dart';

import 'package:pit_check/features/inspections/ui/inspections_archive_screen.dart';

import 'package:pit_check/features/settings/ui/settings_screen.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/', builder: (_, _) => const HomeScreen())],
          // routes: [
          //   GoRoute(
          //     path: '/',
          //     builder: (_, _) =>
          //         ErrorView(message: 'An error occurred', onRetry: () {}),
          //   ),
          // ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sheets',
              builder: (_, _) => const InspectionSheetsScreen(),
              routes: [
                GoRoute(
                  path: ':sheetId',
                  builder: (_, state) => InspectionSheetScreen(
                    sheetId: state.pathParameters['sheetId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/archive',
              builder: (_, _) => const InspectionsArchiveScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (_, _) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
