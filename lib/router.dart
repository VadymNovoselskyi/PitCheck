import 'package:go_router/go_router.dart';
import 'package:pit_check/Home.dart';
import 'package:pit_check/features/inspection_sheets/ui/inspection_sheet_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => const Home()),
    GoRoute(
      path: '/inspection-sheets/:id',
      builder: (_, state) =>
          InspectionSheetScreen(id: state.pathParameters['id']!),
    ),
  ],
);
