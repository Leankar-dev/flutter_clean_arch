import 'package:flutter_clean_arch/core/database/app_database.dart';
import 'package:flutter_clean_arch/core/database/tables/habts_table.dart';
import 'package:flutter_clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:flutter_clean_arch/features/habits/data/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class HabitLocalDatasourceImpl implements HabitLocalDatasource {
  Future<Database> get _db async => AppDatabase.instance;

  @override
  Future<void> deleteHabit(String id) async {
    final db = await _db;

    // executar o comando de deleção no banco de dados
    await db.delete(
      habitsTableName,
      where: '$habitIdColumn = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await _db;

    // executar o comando de busca no banco de dados
    final habitsMap = await db.query(habitsTableName);
    return habitsMap.map((habit) => HabitModel.fromMap(habit)).toList();
  }

  @override
  Future<void> insertHabit(HabitModel habit) async {
    final db = await _db;

    // executar o comando de inserção no banco de dados
    await db.insert(
      habitsTableName,
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final db = await _db;

    // executar o comando de atualização no banco de dados
    await db.update(
      habitsTableName,
      habit.toMap(),
      where: '$habitIdColumn = ?',
      whereArgs: [habit.id],
    );
  }
}
