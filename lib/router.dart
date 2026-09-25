import 'package:go_router/go_router.dart';

import 'package:pit_check/app_shell.dart';

import 'package:pit_check/home_screen.dart';

import 'package:pit_check/features/inspection_sheets/ui/details/inspection_sheet_details_screen.dart';
import 'package:pit_check/features/inspection_sheets/ui/list/inspection_sheets_screen.dart';
import 'package:pit_check/features/inspections/ui/inspection_screen.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_screen.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_details_screen.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_details_screen.dart';

import 'package:pit_check/features/inspections/ui/inspections_archive_screen.dart';
import 'package:pit_check/features/inspections/ui/setup/start_inspection_screen.dart';

import 'package:pit_check/features/settings/ui/settings_screen.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (_, _) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'inspections/new',
                  name: startInspectionRouteName,
                  builder: (_, _) => const StartInspectionScreen(),
                ),
                GoRoute(
                  path: 'inspections/:inspectionId/results/:pointId',
                  name: inspectionPointResultRouteName,
                  builder: (_, state) => InspectionPointResultDetailsScreen(
                    inspectionId: state.pathParameters['inspectionId']!,
                    pointId: state.pathParameters['pointId']!,
                  ),
                ),
                GoRoute(
                  path: 'inspections/:inspectionId/judge',
                  name: judgeRouteName,
                  builder: (_, state) => JudgeScreen(
                    inspectionId: state.pathParameters['inspectionId']!,
                    initialPointId: state.uri.queryParameters['pointId'],
                  ),
                ),
                GoRoute(
                  path: 'inspections/:inspectionId',
                  name: inspectionRouteName,
                  builder: (_, state) => InspectionScreen(
                    inspectionId: state.pathParameters['inspectionId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sheets',
              builder: (_, _) => const InspectionSheetsScreen(),
              routes: [
                GoRoute(
                  path: ':sheetId',
                  builder: (_, state) => InspectionSheetDetailsScreen(
                    sheetId: state.pathParameters['sheetId']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'categories/:categoryId/subcategories/:subcategoryId/points/:pointId',
                      builder: (_, state) => ScrutPointDetailsScreen(
                        sheetId: state.pathParameters['sheetId']!,
                        categoryId: state.pathParameters['categoryId']!,
                        subcategoryId: state.pathParameters['subcategoryId']!,
                        pointId: state.pathParameters['pointId']!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/inspections-archive',
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
