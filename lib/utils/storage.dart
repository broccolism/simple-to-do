import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:simple_to_do/models/todo.dart';

class TodoStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todo.txt');
  }

  Future<File> writeTodo(List<Todo> todoList) async {
    final file = await _localFile;

    return file.writeAsString('$todoList');
  }

  Future<List<Todo>> readTodo() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();

      return [];
    } catch (e) {
      return [Todo.readError()];
    }
  }
}
