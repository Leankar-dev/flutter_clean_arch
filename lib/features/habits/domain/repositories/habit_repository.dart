// o repositorio tem a responsabilidade de pegar os dados do banco de dados, ou seja,
//ele é a camada de acesso aos dados. Ele pode ter varias implementações,
// como por exemplo, uma implementação que pega os dados do banco de dados local,
//outra que pega os dados de uma API, etc.

import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';

abstract class HabitRepository {
  Future<void> insert(Habit habit);
  Future<List<Habit>> get();
  Future<void> update(Habit habit);
  Future<void> delete(String id);
}
