import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/lobby/inspection_lobby_members.dart';
import 'package:pit_check/features/inspections/ui/lobby/inspection_lobby_scope.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class InspectionLobbyScreen extends ConsumerStatefulWidget {
  const InspectionLobbyScreen({super.key, required this.inspection});

  final Inspection inspection;

  @override
  ConsumerState<InspectionLobbyScreen> createState() =>
      _InspectionLobbyScreenState();
}

class _InspectionLobbyScreenState extends ConsumerState<InspectionLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final isCreator =
        widget.inspection.auditMetadata.createdById == currentUser.id;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _LobbyHeader(inspection: widget.inspection),
        const SizedBox(height: 16),

        InspectionLobbyMembers(inspectionId: widget.inspection.id),
        const SizedBox(height: 16),

        InspectionLobbyScope(inspection: widget.inspection),

        if (isCreator) ...[
          const SizedBox(height: 24),
          _LobbyActions(onStart: _startInspection, onCancel: _confirmCancel),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  Future<void> _startInspection() async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      await ref
          .read(inspectionActionsProvider.notifier)
          .start(widget.inspection);
    } catch (_) {
      showAppSnackBar(messenger, 'Could not start the inspection');
    }
  }

  Future<void> _confirmCancel() async {
    final messenger = ScaffoldMessenger.of(context);
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cancel lobby?'),
            content: const Text(
              'The unused lobby and its members will be permanently deleted',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Keep lobby'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Cancel lobby'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed || !mounted) return;

    final router = GoRouter.of(context);
    try {
      await ref
          .read(inspectionActionsProvider.notifier)
          .cancel(widget.inspection);
      router.go('/');
    } catch (_) {
      showAppSnackBar(messenger, 'Could not cancel the inspection lobby');
    }
  }
}

class _LobbyHeader extends StatelessWidget {
  const _LobbyHeader({required this.inspection});

  final Inspection inspection;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waiting to start...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Created by ${inspection.auditMetadata.createdByName}'),
          ],
        ),
      ),
    );
  }
}

class _LobbyActions extends StatelessWidget {
  const _LobbyActions({required this.onStart, required this.onCancel});

  final VoidCallback onStart;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            child: const Text('Cancel lobby'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            onPressed: onStart,
            child: const Text('Start inspection'),
          ),
        ),
      ],
    );
  }
}
