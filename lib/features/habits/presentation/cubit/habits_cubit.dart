import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/delete_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/get_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/insert_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/update_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_state.dart';
import 'package:uuid/uuid.dart';

// criar o cubit para manipular os estados do app
// o cubit é responsável por manipular os estados do app e fornecer os dados para a interface do usuário
// faz todas as operações que envolvem o useCases.

class HabitsCubit extends Cubit<HabitsState> {
  final GetHabitUseCase _getHabitUseCase;
  final InsertHabitUseCase _insertHabitUseCase;
  final UpdateHabitUseCase _updateHabitUseCase;
  final DeleteHabitUseCase _deleteHabitUseCase;

  HabitsCubit(
    this._getHabitUseCase,
    this._insertHabitUseCase,
    this._updateHabitUseCase,
    this._deleteHabitUseCase,
  ) : super(HabitsInitialState());

  // criar os métodos para manipular os estados do app

  // metodo para buscar os hábitos
  Future<void> getHabits() async {
    emit(HabitsLoadingState());

    try {
      final habits = await _getHabitUseCase();
      emit(HabitsLoadedState(habits));
    } catch (e) {
      emit(
        HabitsErrorState(e.toString()),
      ); // emitir o estado de erro caso ocorra algum erro
    }
  }

  // metodo para criar um hábito
  Future<void> insertHabit(String title) async {
    try {
      final habit = Habit(
        id: Uuid().v4(),
        title: title,
        createAt: DateTime.now(),
      );
      await _insertHabitUseCase(habit);
      await getHabits();
    } catch (e) {
      emit(HabitsErrorState(e.toString()));
    }
  }

  // metodo para atualizar um hábito
  Future<void> updateHabit(Habit habit) async {
    try {
      await _updateHabitUseCase(habit);
      await getHabits();
    } catch (e) {
      emit(HabitsErrorState(e.toString()));
    }
  }

  // metodo para deletar um hábito
  // Future<void> deleteHabit(String id) async {
  //   try {
  //     await _deleteHabitUseCase(id);
  //     await getHabits();
  //   } catch (e) {
  //     emit(HabitsErrorState(e.toString()));
  //   }
  // }
}
