import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/delete_habit_cubit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/delete_habit_state.dart';

class HabitCardWidget extends StatelessWidget {
  final Habit habit;

  const HabitCardWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    // instanciar o cubit para deletar o hábito
    final cubit = sl<DeleteHabitCubit>();

    return Card(
      child: ListTile(
        title: Text(habit.title),
        trailing: Column(
          children: [
            IconButton(
              onPressed: () {
                cubit.deleteHabit(habit.id);
              },
              icon: BlocBuilder<DeleteHabitCubit, DeleteHabitState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is DeletingHabitState &&
                      state.deltingId == habit.id) {
                    return const CircularProgressIndicator();
                  }
                  return Icon(Icons.delete, color: Colors.red);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
