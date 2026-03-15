// uma classe abstrata para o datasource local de hábitos, que define os métodos que devem ser
//implementados por qualquer classe que queira ser um datasource local de hábitos.

import 'package:flutter_clean_arch/features/habits/data/models/habit_model.dart';

abstract class HabitLocalDatasource {
  // metodos(contratos) para criar, buscar,update e deletar habitos.
  Future<void> insertHabit(HabitModel habit);
  Future<List<HabitModel>> getHabits();
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(String id);
}
