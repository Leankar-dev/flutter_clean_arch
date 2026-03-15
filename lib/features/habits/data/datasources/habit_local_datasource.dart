// uma classe abstrata para o datasource local de hábitos, que define os métodos que devem ser
//implementados por qualquer classe que queira ser um datasource local de hábitos.

abstract class HabitLocalDatasource {
  // metodos(contratos) para criar, buscar,update e deletar habitos.
  Future<void> insertHabit(Map<String, dynamic> habit);
  Future<List<Map<String, dynamic>>> getHabits();
  Future<void> updateHabit(Map<String, dynamic> habit);
  Future<void> deleteHabit(String id);
}
