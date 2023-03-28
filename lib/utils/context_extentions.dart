import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  void showSnackBar({
    required String massage,
    bool error = false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(massage),
        backgroundColor: error ? Colors.red.shade300: Colors.blue.shade300,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsetsDirectional.all(10),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
