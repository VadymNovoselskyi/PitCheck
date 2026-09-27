import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_presentation.dart';

class JudgeDecisionForm extends StatefulWidget {
  const JudgeDecisionForm({
    super.key,
    required this.result,
    required this.onSubmit,
  });

  final InspectionPointResult result;
  final ValueChanged<InspectionPointDecisionInput> onSubmit;

  @override
  State<JudgeDecisionForm> createState() => _JudgeDecisionFormState();
}

class _JudgeDecisionFormState extends State<JudgeDecisionForm> {
  final _formKey = GlobalKey<FormState>();
  late String _note;
  late InspectionPointStatus _status;
  late final InspectionPointStatus _initialStatus;
  late final String _initialNote;

  @override
  void initState() {
    super.initState();
    _initialStatus = widget.result.currentStatus;
    _initialNote = widget.result.currentNote;
    _status = _initialStatus;
    _note = _initialNote;
  }

  void _save() {
    _formKey.currentState!.save();
    if (_status == _initialStatus && _note == _initialNote) return;

    widget.onSubmit(
      InspectionPointDecisionInput(status: _status, comment: _note),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Decision', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),

              DropdownButtonFormField<InspectionPointStatus>(
                initialValue: _initialStatus == InspectionPointStatus.pending
                    ? null
                    : _initialStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                isExpanded: true,
                hint: const Text('Choose a status'),
                items: [
                  for (final status in const [
                    InspectionPointStatus.passed,
                    InspectionPointStatus.failed,
                    InspectionPointStatus.skipped,
                    InspectionPointStatus.notApplicable,
                  ])
                    DropdownMenuItem(
                      value: status,
                      child: Row(
                        children: [
                          Icon(
                            status.icon,
                            size: 20,
                            color: status.color(context),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              status.label,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
                onChanged: (_) {},
                onSaved: (value) => _status = value ?? _initialStatus,
              ),
              const SizedBox(height: 12),

              TextFormField(
                initialValue: _initialNote,
                onSaved: (value) => _note = value?.trim() ?? '',
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Note (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              FilledButton(
                onPressed: _save,
                child: const Text('Save decision'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
