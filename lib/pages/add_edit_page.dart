import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../provider/todo_list_provider.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _task;
  String? _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          onWillPop: () {
            return Future(() => true);
          },
          child: ListView(
            children: [
              TextFormField(
                autofocus: true,
                style: Theme.of(context).textTheme.headline5,
                decoration: const InputDecoration(
                  hintText: 'O que precisa ser feito?',
                ),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {
                    return 'Digit o nome do TODO';
                  }
                  return null;
                },
                onSaved: (value) => _task = value!
              ),
              TextFormField(
                maxLines: 10,
                style: Theme.of(context).textTheme.subtitle1,
                decoration: const InputDecoration(
                  hintText: 'Notas adicionais...',
                ),
                onSaved: (value) => _note = value ?? '',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Salvar',
        child: const Icon(Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form!.validate()) {
            form.save();

            final todoProvider = context.read<TodoListProvider>();
            todoProvider.addTodo(Todo(_task!, note: _note ?? ''));
            
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
