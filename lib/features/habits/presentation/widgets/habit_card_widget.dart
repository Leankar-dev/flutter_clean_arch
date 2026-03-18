import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_cubit.dart';

class HabitCardWidget extends StatelessWidget {
  final Habit habit;

  const HabitCardWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    // instanciar o cubit para deletar o hábito
    final cubit = sl<HabitsCubit>();

    return Card(
      child: ListTile(
        title: Text(habit.title),
        trailing: Column(
          children: [
            IconButton(
              onPressed: () {
                cubit.deleteHabit(habit.id);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
