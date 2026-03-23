import 'package:flutter/material.dart';

class EmptyHabitViewWidget extends StatelessWidget {
  const EmptyHabitViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Nenhum hábito encontrado',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Adicione um novo hábito para começar',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
