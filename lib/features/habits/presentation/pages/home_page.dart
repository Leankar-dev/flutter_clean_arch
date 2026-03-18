import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_state.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/habits_form_dialog.dart';
import 'package:flutter_clean_arch/features/habits/presentation/widgets/list_habits_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HabitsCubit habitsCubit = sl<HabitsCubit>();

  @override
  void initState() {
    super.initState();
    habitsCubit.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habits App - Clean Architecture')),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          // verificar o estado do cubit
          if (state is HabitsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HabitsLoadedState) {
            return ListHabitsWidget(habits: state.habits);
          }
          if (state is HabitsErrorState) {
            return Center(child: Text('Error: ${state.erroMessage}'));
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
