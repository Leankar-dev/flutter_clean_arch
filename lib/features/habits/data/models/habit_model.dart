import 'package:flutter_clean_arch/core/database/tables/habts_table.dart';

// modelo de dados para representar um hábito, com os campos id, title, createdAt e description (representa uma tabela no banco de dados)

class HabitModel {
  final String id;
  final String title;
  final DateTime createdAt;
  final String? description;

  HabitModel({
    required this.id,
    required this.title,
    required this.createdAt,
    this.description,
  });

  // para ler os dados do banco de dados e transformar em um objeto HabitModel
  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map[habitIdColumn],
      title: map[habitTitleColumn],
      createdAt: DateTime.parse(map[habitCreatedAtColumn]),
      description: map[habitDescriptionColumn],
    );
  }

  // para transformar um objeto HabitModel em um mapa para salvar no banco de dados
  Map<String, dynamic> toMap() {
    return {
      habitIdColumn: id,
      habitTitleColumn: title,
      habitCreatedAtColumn: createdAt.toIso8601String(),
      habitDescriptionColumn: description,
    };
  }
}
