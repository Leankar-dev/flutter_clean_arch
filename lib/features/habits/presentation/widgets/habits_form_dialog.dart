import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/di/injector_container.dart';
import 'package:flutter_clean_arch/features/habits/presentation/cubit/habits_cubit.dart';

class HabitsFormDialog extends StatefulWidget {
  const HabitsFormDialog({super.key});

  @override
  State<HabitsFormDialog> createState() => _HabitsFormDialogState();
}

class _HabitsFormDialogState extends State<HabitsFormDialog> {
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final habitsCubit = sl<HabitsCubit>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) return;

    final title = _controller.text.trim();
    await habitsCubit.insertHabit(title);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Novo Hábito'),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: _controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Por favor, insira um nome para o hábito';
            }
            return null;
          },
          decoration: const InputDecoration(labelText: 'Nome do hábito'),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            _submit();
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
