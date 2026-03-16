// criar uma instancia global do injector de dependencias
import 'package:flutter_clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:flutter_clean_arch/features/habits/data/datasources/habit_local_datasource_impl.dart';
import 'package:flutter_clean_arch/features/habits/data/repositories/habit_repository_impl.dart';
import 'package:flutter_clean_arch/features/habits/domain/repositories/habit_repository.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/delete_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/get_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/insert_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/domain/use_cases/update_habit_use_case.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // aqui voce pode registrar todas as dependencias, por exemplo:
  // sl.registerLazySingleton(() => MyService());

  sl.registerLazySingleton<HabitLocalDatasource>(
    () => HabitLocalDatasourceImpl(),
  );

  sl.registerLazySingleton<HabitRepository>(() => HabitRepositoryImpl(sl()));

  sl.registerLazySingleton(() => DeleteHabitUseCase(sl()));
  sl.registerLazySingleton(() => GetHabitUseCase(sl()));
  sl.registerLazySingleton(() => UpdateHabitUseCase(sl()));
  sl.registerLazySingleton(() => InsertHabitUseCase(sl()));

  sl.registerLazySingleton(() => HabitsCubit(sl(), sl(), sl(), sl()));
}


// essas dependencias podem ser injetadas em qualquer lugar do app.
// vamos inicializar o injector no main.dart, antes de rodar o app, para garantir que todas as dependencias estejam disponiveis.
// no main.dart, voce pode chamar initDependencies() antes de runApp():