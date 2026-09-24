import 'package:flutter/material.dart';

void showAppSnackBar(ScaffoldMessengerState messenger, String message) {
  if (!messenger.mounted) return;

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
