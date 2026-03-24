import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/delete_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/delete_habit_state.dart';

class DeleteHabitCubit extends Cubit<DeleteHabitState> {
  final DeleteHabitUseCase _deleteHabitUseCase;

  DeleteHabitCubit(this._deleteHabitUseCase) : super(DeleteHabitInitial());

  Future<void> deleteHabit(String id) async {
    emit(DeletingHabitState(id));

    try {
      await _deleteHabitUseCase(id);
      emit(DeleteHabitSuccess());
    } catch (e) {
      emit(DeleteHabitError(e.toString()));
    }
  }
}
