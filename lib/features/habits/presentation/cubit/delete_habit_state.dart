abstract class DeleteHabitState {}

class DeleteHabitInitial implements DeleteHabitState {}

class DeletingHabitState implements DeleteHabitState {
  final String deltingId;

  DeletingHabitState(this.deltingId);
}

class DeleteHabitSuccess implements DeleteHabitState {}

class DeleteHabitError implements DeleteHabitState {
  final String message;

  DeleteHabitError(this.message);
}
