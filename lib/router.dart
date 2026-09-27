import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/app_shell.dart';
import 'package:pit_check/route_names.dart';
import 'package:pit_check/features/users/routing/auth_redirect.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/features/users/ui/auth/account_error_screen.dart';
import 'package:pit_check/features/users/ui/auth/auth_loading_screen.dart';
import 'package:pit_check/features/users/ui/auth/login_screen.dart';
import 'package:pit_check/features/users/ui/auth/reset_password_screen.dart';
import 'package:pit_check/features/users/ui/auth/sign_up_screen.dart';

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

part 'router.g.dart';

// Router is a provider because we need to listen to the user login state
@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    redirect: (_, state) => authRedirect(ref.read(appUserProvider), state.uri),
    routes: [
      // Main routes, StatefulShellRoute is needed for the bottomAppBar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: RouteNames.home,
                builder: (_, _) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'inspections/new',
                    name: RouteNames.startInspection,
                    builder: (_, _) => const StartInspectionScreen(),
                  ),
                  GoRoute(
                    path: 'inspections/:inspectionId/results/:pointId',
                    name: RouteNames.inspectionPointResult,
                    builder: (_, state) => InspectionPointResultDetailsScreen(
                      inspectionId: state.pathParameters['inspectionId']!,
                      pointId: state.pathParameters['pointId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'inspections/:inspectionId/judge',
                    name: RouteNames.judge,
                    builder: (_, state) => JudgeScreen(
                      inspectionId: state.pathParameters['inspectionId']!,
                      initialPointId: state.uri.queryParameters['pointId'],
                    ),
                  ),
                  GoRoute(
                    path: 'inspections/:inspectionId',
                    name: RouteNames.inspection,
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
                name: RouteNames.sheets,
                builder: (_, _) => const InspectionSheetsScreen(),
                routes: [
                  GoRoute(
                    path: ':sheetId',
                    name: RouteNames.sheetDetails,
                    builder: (_, state) => InspectionSheetDetailsScreen(
                      sheetId: state.pathParameters['sheetId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'categories/:categoryId/subcategories/:subcategoryId/points/:pointId',
                        name: RouteNames.scrutPointDetails,
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
                name: RouteNames.inspectionsArchive,
                builder: (_, _) => const InspectionsArchiveScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: RouteNames.settings,
                builder: (_, _) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),

      // Auth state routes
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (_, state) =>
            LoginScreen(from: state.uri.queryParameters['from']),
        routes: [
          GoRoute(
            path: 'signup',
            name: RouteNames.signUp,
            builder: (_, _) => const SignUpScreen(),
          ),
          GoRoute(
            path: 'reset-password',
            name: RouteNames.resetPassword,
            builder: (_, _) => const ResetPasswordScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/loading',
        name: RouteNames.authLoading,
        builder: (_, _) => const AuthLoadingScreen(),
      ),
      GoRoute(
        path: '/account-error',
        name: RouteNames.accountError,
        builder: (_, _) => const AccountErrorScreen(),
      ),
    ],
  );

  ref.listen(appUserProvider, (_, _) => router.refresh());
  ref.onDispose(router.dispose);
  return router;
}
