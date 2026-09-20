import 'package:flutter/material.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';

class InspectionSheetForm extends StatefulWidget {
  const InspectionSheetForm({super.key, this.initialValue});

  final InspectionSheetInput? initialValue;

  @override
  State<InspectionSheetForm> createState() => _InspectionSheetFormState();
}

class _InspectionSheetFormState extends State<InspectionSheetForm> {
  final _formKey = GlobalKey<FormState>();

  String _competitionName = '';
  int _year = 0;
  String _description = '';
  String? _sourceUrl;

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _validateYear(String? value) {
    final year = int.tryParse(value?.trim() ?? '');

    if (year == null) {
      return 'Enter a valid year';
    }

    return null;
  }

  String? _validateUrl(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) return null;

    final uri = Uri.tryParse(text);

    if (uri == null) {
      return 'Enter a full http or https URL';
    }

    return null;
  }

  void _submit() {
    final form = _formKey.currentState!;

    if (!form.validate()) return;

    form.save();

    Navigator.pop(
      context,
      InspectionSheetInput(
        competitionName: _competitionName,
        year: _year,
        description: _description,
        sourceUrl: _sourceUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final initialValue = widget.initialValue;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 8,
        right: 20,
        bottom: 8 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                initialValue == null
                    ? 'Add inspection sheet'
                    : 'Edit inspection sheet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 26),

              TextFormField(
                initialValue: initialValue?.competitionName,
                decoration: const InputDecoration(
                  labelText: 'Competition name',
                ),
                textInputAction: TextInputAction.next,
                validator: _requiredValidator,
                onSaved: (value) {
                  _competitionName = value!.trim();
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                initialValue: initialValue?.year.toString(),
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: _validateYear,
                onSaved: (value) {
                  _year = int.parse(value!.trim());
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                initialValue: initialValue?.description,
                decoration: const InputDecoration(labelText: 'Description'),
                minLines: 1,
                maxLines: 5,
                textInputAction: TextInputAction.next,
                validator: _requiredValidator,
                onSaved: (value) {
                  _description = value!.trim();
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                initialValue: initialValue?.sourceUrl,
                decoration: const InputDecoration(
                  labelText: 'Source URL (optional)',
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                validator: _validateUrl,
                onSaved: (value) {
                  final text = value?.trim() ?? '';
                  _sourceUrl = text.isEmpty ? null : text;
                },
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: _submit,
                    child: Text(initialValue == null ? 'Add' : 'Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
