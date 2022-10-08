import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list_provider.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../util/app_keys.dart';

class TodoList extends StatelessWidget {
  const TodoList() : super();

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoListProvider>();
    return Container(
      child: ListView.builder(
        itemCount: todoProvider.filteredTodos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todoProvider.filteredTodos[index];
          return TodoItem(
            todo: todo,
            onCheckboxChanged: (complete) {
              todoProvider
                  .updateTodo(todo.copyWith(complete: !todo.complete));
            },
          );
        },
      ),
    );
  }
}
