import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_provider.dart';
import '../util/app_keys.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter() : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Todos Completos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Consumer<TodoListProvider>(
              builder: (context, todoList, child) {
                return Text(
                  '${todoList.numCompleted}',
                  style: Theme.of(context).textTheme.subtitle1,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Todos Ativos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Consumer<TodoListProvider>(
              builder: (context, todoList, child) {
                return Text(
                  '${todoList.numActive}',
                  style: Theme.of(context).textTheme.subtitle1,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
