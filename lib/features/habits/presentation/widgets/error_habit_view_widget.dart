import 'package:flutter/material.dart';

class ErrorHabitViewWidget extends StatelessWidget {
  final String error;

  const ErrorHabitViewWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $error',
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
