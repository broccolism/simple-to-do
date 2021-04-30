import 'package:hive/hive.dart';
import 'package:simple_to_do/constants/enums.dart';
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
      int routineCount,
      DateTime doneAt,
      List<Todo> children}) {
    Todo target = box.get(id);
    if (target == null) {
      return;
    }

    target.name = name ?? target.name;
    target.state = state ?? target.state;
    target.routineCount = routineCount ?? target.routineCount;
    target.doneAt = doneAt ?? target.doneAt;
    target.save();
  }

  List<Todo> getAllTodo() {
    List<Todo> todoList = HiveList<Todo>(box);
    return todoList;
  }
}
