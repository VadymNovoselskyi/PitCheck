import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/scrut_point.dart';

class ScrutPointForm extends StatefulWidget {
  const ScrutPointForm({super.key, required this.initialValue});

  final ScrutPointInput initialValue;

  @override
  State<ScrutPointForm> createState() => _ScrutPointFormState();
}

class _ScrutPointFormState extends State<ScrutPointForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  void _submit() {
    final form = _formKey.currentState!;

    if (!form.validate()) return;

    form.save();

    Navigator.pop(
      context,
      ScrutPointInput(name: _name, description: _description),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit scrut point',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              TextFormField(
                initialValue: widget.initialValue.name,
                decoration: const InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!.trim();
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: widget.initialValue.description,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  alignLabelWithHint: true,
                ),
                minLines: 2,
                maxLines: 8,
                textInputAction: TextInputAction.newline,
                onSaved: (value) {
                  _description = value?.trim() ?? '';
                },
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
                  FilledButton(onPressed: _submit, child: const Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
