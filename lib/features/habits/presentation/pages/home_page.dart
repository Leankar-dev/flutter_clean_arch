import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/delete_habit_cubit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/delete_habit_state.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_state.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/empty_habit_view_widget.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/error_habit_view_widget.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/habits_form_dialog.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/list_habits_widget.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/loading_habit_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HabitsCubit habitsCubit = sl<HabitsCubit>();
  final DeleteHabitCubit deleteHabitCubit = sl<DeleteHabitCubit>();
  late final StreamSubscription _deleteHabitSubscription;

  @override
  void initState() {
    super.initState();
    habitsCubit.getHabits();
    _deleteHabitSubscription = deleteHabitCubit.stream.listen((state) {
      if (state is DeleteHabitSuccess) {
        habitsCubit.getHabits(); // atualiza a lista de hábitos após deletar
      }
    });
  }

  @override
  void dispose() {
    _deleteHabitSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habits App - Clean Architecture')),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          // verificar o estado do cubit
          if (state is HabitsLoadingState) {
            return const LoadingHabitViewWidget();
          }
          if (state is HabitsLoadedState) {
            if (state.habits.isEmpty) {
              return const EmptyHabitViewWidget();
            }
            return ListHabitsWidget(habits: state.habits);
          }
          if (state is HabitsErrorState) {
            return ErrorHabitViewWidget(error: state.erroMessage);
          }
          return const SizedBox.shrink();
        },
        bloc: habitsCubit,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => HabitsFormDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
