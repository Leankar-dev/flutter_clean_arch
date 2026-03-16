// criar os estados do app

import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';

abstract class HabitsState {
  const HabitsState();
}

class HabitsInitialState extends HabitsState {}

class HabitsLoadingState extends HabitsState {}

class HabitsLoadedState extends HabitsState {
  final List<Habit> habits;

  const HabitsLoadedState(this.habits);
}

class HabitsErrorState extends HabitsState {
  final String erroMessage;

  const HabitsErrorState(this.erroMessage);
}
