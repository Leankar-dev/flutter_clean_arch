import 'package:flutter/material.dart';

class LoadingHabitViewWidget extends StatelessWidget {
  const LoadingHabitViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
