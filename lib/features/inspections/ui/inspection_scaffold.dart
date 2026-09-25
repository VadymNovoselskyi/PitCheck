import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/inspections/state/inspection_member_providers.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_screen.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class InspectionScaffold extends ConsumerWidget {
  const InspectionScaffold({
    super.key,
    required this.inspectionId,
    required this.title,
    required this.body,
  });

  final String inspectionId;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspectionProvider = inspectionByIdProvider(inspectionId);
    final memberProvider = inspectionMemberByUserIdProvider(
      inspectionId,
      ref.watch(currentUserProvider).id,
    );

    final inspection = ref.watch(inspectionProvider).value;
    final member = ref.watch(memberProvider).value;
    final showJudgeActions =
        inspection?.isRunning == true &&
        member?.role == InspectionMemberRole.judge;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (showJudgeActions)
            IconButton(
              tooltip: 'Judge view',
              onPressed: () => context.goNamed(
                judgeRouteName,
                pathParameters: {'inspectionId': inspectionId},
              ),
              icon: const Icon(Icons.rate_review_outlined),
            ),
        ],
      ),
      body: body,
      floatingActionButton: showJudgeActions
          ? FloatingActionButton.extended(
              shape: const StadiumBorder(),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () => _confirmFinish(context, ref, inspection!),
              icon: const Icon(Icons.flag_outlined),
              label: Text(
                'Finish inspection',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          : null,
    );
  }

  Future<void> _confirmFinish(
    BuildContext context,
    WidgetRef ref,
    Inspection inspection,
  ) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Finish inspection?'),
            content: const Text(
              'This will mark the inspection as completed and set its end time',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Keep inspecting'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Finish inspection'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(inspectionActionsProvider.notifier).finish(inspection);
    } catch (_) {
      showAppSnackBar(messenger, 'Could not finish the inspection');
    }
  }
}
