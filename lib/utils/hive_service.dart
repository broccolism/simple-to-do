import 'package:hive/hive.dart';
import 'package:simple_to_do/constants/enums.dart';
import 'package:simple_to_do/models/tag.dart';

import 'package:simple_to_do/models/todo.dart';

class HiveService {
  Box box;
  HiveService(this.box);

  void createNewTodo(Todo todo) {
    box.put(todo.id, todo);
  }

  void updateTodo(int id,
      {String name,
      TodoState state,
      int progress,
      List<TodoTag> tags,
      DateTime expiredAt,
      List<Todo> children}) {
    Todo target = box.get(id);
    if (target == null) {
      return;
    }

    target.name = name ?? target.name;
    target.state = state ?? target.state;
    target.progress = progress ?? target.progress;
    target.expiredAt = expiredAt ?? target.expiredAt;
    target.children = children ?? target.children;

    target.save();
  }

  List<Todo> getAllTodo() {
    List<Todo> todoList = HiveList<Todo>(box);
    return todoList;
  }
}
