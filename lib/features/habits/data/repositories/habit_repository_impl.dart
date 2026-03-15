import 'package:flutter_clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:flutter_clean_arch/features/habits/data/models/habit_model.dart';
import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';
import 'package:flutter_clean_arch/features/habits/domain/repositories/habit_repository.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDatasource _datasource;

  const HabitRepositoryImpl(this._datasource);

  @override
  Future<void> delete(String id) async {
    await _datasource.deleteHabit(id);
  }

  @override
  Future<List<Habit>> get() async {
    final models = await _datasource.getHabits();

    // transformar os models em entities, ou seja, transformar os dados do banco de dados em objetos que a camada de domínio entende.
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> insert(Habit habit) async {
    await _datasource.insertHabit(HabitModel.fromEntity(habit));
  }

  @override
  Future<void> update(Habit habit) async {
    await _datasource.updateHabit(HabitModel.fromEntity(habit));
  }
}
