// proposito deste arquivo: a classe será responsável por criar a conexão com o banco de dados, e fornecer métodos para acessar os dados.
// é uma especie de database provider.

import 'package:flutter_clean_arch/core/database/tables/habts_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Database? _database;

  static Future<Database> get instance async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // função para abrir o banco de dados
  static Future<Database> _initDatabase() async {
    // aqui você pode usar o path_provider para obter o caminho do banco de dados
    // e criar o banco de dados se ele não existir
    // por exemplo:
    // final documentsDirectory = await getApplicationDocumentsDirectory();
    // final path = join(documentsDirectory.path, 'ap_database.db');
    // return await openDatabase(path, version: 1, onCreate: _onCreate);
    final path = join(await getDatabasesPath(), 'focus_flow.db');

    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // função para criar as tabelas do banco de dados
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(createHabtsTable);
  }
}
