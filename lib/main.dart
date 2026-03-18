import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/my_app_widget.dart';

void main() async {
  await initDependencies(); // inicializa o injector de dependencias
  runApp(const MyApp());
}
