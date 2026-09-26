import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/inspections/state/inspection_member_providers.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_header.dart';
import 'package:pit_check/features/inspections/ui/home/home_join_sheet.dart';
import 'package:pit_check/features/inspections/ui/inspection_screen.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class HomeActiveInspection extends ConsumerWidget {
  const HomeActiveInspection({super.key, required this.inspection});

  final Inspection inspection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membershipProvider = inspectionMemberByUserIdProvider(
      inspection.id,
      ref.watch(currentUserProvider).id,
    );
    final membership = ref.watch(membershipProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          inspection.isLobby ? 'Inspection lobby' : 'Live inspection',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),

        InspectionDetailsHeader(inspection: inspection),
        const SizedBox(height: 12),

        membership.when(
          data: (member) => FilledButton(
            onPressed: member == null
                ? () => _join(context, ref)
                : () => _open(context),
            child: Text(member == null ? 'Join inspection' : 'Open inspection'),
          ),

          loading: () => const InlineLoading(),
          error: (error, _) => InlineError(
            message: 'Could not load your membership ($error)',
            onRetry: () => ref.invalidate(membershipProvider),
          ),
        ),
      ],
    );
  }

  void _open(BuildContext context) {
    context.pushNamed(
      inspectionRouteName,
      pathParameters: {'inspectionId': inspection.id},
    );
  }

  Future<void> _join(BuildContext context, WidgetRef ref) async {
    final role = await showModalBottomSheet<InspectionMemberRole>(
      context: context,
      builder: (_) => const HomeJoinSheet(),
    );
    if (role == null || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref
          .read(inspectionMemberActionsProvider.notifier)
          .join(inspection.id, role);
      if (!context.mounted) return;
      _open(context);
    } catch (_) {
      showAppSnackBar(messenger, 'Could not join the inspection');
    }
  }
}
