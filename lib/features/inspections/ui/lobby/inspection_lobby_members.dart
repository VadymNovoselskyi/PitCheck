import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/inspections/state/inspection_member_providers.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionLobbyMembers extends ConsumerWidget {
  const InspectionLobbyMembers({super.key, required this.inspectionId});

  final String inspectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = inspectionMembersProvider(inspectionId);
    final members = ref.watch(provider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Members', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            members.when(
              data: (items) {
                if (items.isEmpty) {
                  return const InlineEmpty(
                    message: 'No one has joined this lobby yet',
                  );
                }

                return Column(
                  children: [
                    for (final member in items)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          child: Icon(Icons.person_outline),
                        ),
                        title: Text(member.displayName),
                        subtitle: Text(switch (member.role) {
                          InspectionMemberRole.judge => 'Judge',
                          InspectionMemberRole.participant => 'Participant',
                        }),
                      ),
                  ],
                );
              },

              loading: () => const InlineLoading(),

              error: (error, _) => InlineError(
                message: 'Could not load members ($error)',
                onRetry: () => ref.invalidate(provider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
