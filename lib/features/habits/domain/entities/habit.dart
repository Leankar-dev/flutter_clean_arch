// as entidades representam os objetos de negócio da aplicação, ou seja,
//as classes que representam os dados e as regras de negócio da aplicação.
// Elas são usadas para representar os dados que serão armazenados no banco de dados e
// para implementar as regras de negócio da aplicação.
// o ideal é que as entidades tivessem somente objetos puros em Dart, ou seja,
//sem dependências de outras classes ou pacotes, para facilitar a manutenção e a testabilidade da aplicação.

class Habit {
  final String id;
  final String title;
  final DateTime createAt;
  final String? description;

  const Habit({
    required this.id,
    required this.title,
    required this.createAt,
    this.description,
  });
}
