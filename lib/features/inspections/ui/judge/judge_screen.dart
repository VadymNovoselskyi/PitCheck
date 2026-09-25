import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/inspections/state/inspection_member_providers.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/inspection_screen.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_content.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

const judgeRouteName = 'inspection-judge';

class JudgeScreen extends ConsumerWidget {
  const JudgeScreen({
    super.key,
    required this.inspectionId,
    this.initialPointId,
  });

  final String inspectionId;
  final String? initialPointId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspectionProvider = inspectionByIdProvider(inspectionId);
    final memberProvider = inspectionMemberByUserIdProvider(
      inspectionId,
      ref.watch(currentUserProvider).id,
    );

    final inspection = ref.watch(inspectionProvider);
    final member = ref.watch(memberProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Judge view'),
        actions: [
          IconButton(
            tooltip: 'Overview',
            onPressed: () => context.goNamed(
              inspectionRouteName,
              pathParameters: {'inspectionId': inspectionId},
            ),
            icon: const Icon(Icons.view_list_outlined),
          ),
        ],
      ),
      body: inspection.when(
        data: (value) {
          if (value == null) {
            return const EmptyView(
              icon: Icons.fact_check_outlined,
              title: 'Inspection not found',
              message: 'This inspection may have been removed',
            );
          }
          if (!value.isRunning) {
            return const EmptyView(
              icon: Icons.info_outline,
              title: 'Judge view unavailable',
              message: 'This inspection is not running',
            );
          }

          return member.when(
            data: (membership) => membership?.role == InspectionMemberRole.judge
                ? JudgeContent(
                    inspection: value,
                    initialPointId: initialPointId,
                  )
                : const EmptyView(
                    icon: Icons.lock_outline,
                    title: 'Judge access required',
                    message: 'Only judges in this inspection can use this view',
                  ),

            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => ErrorView(
              message: 'Could not load your membership ($error)',
              onRetry: () => ref.invalidate(memberProvider),
            ),
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorView(
          message: 'Could not load the inspection ($error)',
          onRetry: () => ref.invalidate(inspectionProvider),
        ),
      ),
    );
  }
}
