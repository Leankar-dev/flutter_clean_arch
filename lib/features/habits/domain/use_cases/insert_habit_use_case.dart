import 'package:flutter_clean_arch/features/habits/domain/entities/habit.dart';
import 'package:flutter_clean_arch/features/habits/domain/repositories/habit_repository.dart';

/*
Os Use Cases são a camada de regras de negócio da Clean Architecture. 
Cada classe representa uma única ação/operação que o app pode realizar.
Eles recebem as entidades como parâmetros e retornam as entidades ou void, dependendo do caso.
Eles dependem apenas dos repositórios, que são abstrações da camada de dados.

Por que essa camada existe?
Cada use case recebe um HabitRepository (uma abstração/interface), sem saber como os dados são armazenados (SQLite, API, etc.)
Todos expõem um método call(), o que permite chamá-los diretamente como uma função: await getHabitUseCase()
A UI (ou um BLoC/Provider) chama o use case → o use case chama o repositório → o repositório acessa os dados
Isso mantém a separação de responsabilidades: a UI não conhece o banco de dados, e a lógica de negócio não depende de 
detalhes de implementação.
*/

class InsertHabitUseCase {
  final HabitRepository _repository;

  InsertHabitUseCase(this._repository);

  Future<void> call(Habit habit) async {
    return await _repository.insert(habit);
  }
}
