import 'package:flutter_clean_arch/core/database/app_database.dart';
import 'package:flutter_clean_arch/core/database/tables/habts_table.dart';
import 'package:flutter_clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
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
  Future<List<Map<String, dynamic>>> getHabits() async {
    final db = await _db;

    // executar o comando de busca no banco de dados
    return db.query(habitsTableName);
  }

  @override
  Future<void> insertHabit(Map<String, dynamic> habit) async {
    final db = await _db;

    // executar o comando de inserção no banco de dados
    await db.insert(
      habitsTableName,
      habit,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(Map<String, dynamic> habit) async {
    final db = await _db;

    // executar o comando de atualização no banco de dados
    await db.update(
      habitsTableName,
      habit,
      where: '$habitIdColumn = ?',
      whereArgs: [habit[habitIdColumn]],
    );
  }
}
