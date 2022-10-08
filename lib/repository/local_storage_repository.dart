import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repository/todos_repository.dart';

class LocalStorageRepository implements TodosRepository {
  final String _key = 'todos';
  SharedPreferences? _store;

  LocalStorageRepository();

  Future<SharedPreferences> loadStore() async {
    if (_store != null) {
      return _store!;
    }

    return await SharedPreferences.getInstance();
  }

  @override
  Future<List<Todo>> loadTodos() async {
    final store = await loadStore();
    return json
        .decode(store.getString(_key) ?? '')['todos']
        .cast<Map<String, dynamic>>()
        .map<Todo>(Todo.fromJson)
        .toList();
  }

  @override
  Future<bool> saveTodos(List<Todo> todos) async {
    final store = await loadStore();
    return store.setString(
      _key,
      json.encode({
        'todos': todos.map((todo) => todo.toJson()).toList(),
      }),
    );
  }
}
