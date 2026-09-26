import 'package:flutter/material.dart';

import 'package:pit_check/features/inspections/models/inspection_member.dart';

class HomeJoinSheet extends StatefulWidget {
  const HomeJoinSheet({super.key});

  @override
  State<HomeJoinSheet> createState() => _HomeJoinSheetState();
}

class _HomeJoinSheetState extends State<HomeJoinSheet> {
  InspectionMemberRole _role = InspectionMemberRole.participant;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Join inspection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            const Text('Choose your role for this inspection'),
            const SizedBox(height: 20),

            SegmentedButton<InspectionMemberRole>(
              segments: const [
                ButtonSegment(
                  value: InspectionMemberRole.participant,
                  icon: Icon(Icons.person),
                  label: Text('Participant'),
                ),
                ButtonSegment(
                  value: InspectionMemberRole.judge,
                  icon: Icon(Icons.gavel),
                  label: Text('Judge'),
                ),
              ],
              selected: {_role},
              onSelectionChanged: (roles) =>
                  setState(() => _role = roles.first),
            ),
            const SizedBox(height: 20),

            FilledButton(
              onPressed: () => Navigator.pop(context, _role),
              child: const Text('Join inspection'),
            ),
          ],
        ),
      ),
    );
  }
}
