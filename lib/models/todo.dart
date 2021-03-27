import 'package:simple_to_do/constants/enums.dart';
import 'package:simple_to_do/models/tag.dart';

class Todo {
  String name;
  List<TodoTag> tags;
  TodoState state;
  int progress;
  DateTime createdAt;
  DateTime expiredAt;
  List<Todo> children;

  Todo.readError() {
    this.name = null;
    this.tags = null;
    this.state = TodoState.readError;
    this.progress = null;
    this.createdAt = null;
    this.expiredAt = null;
    this.children = null;
  }
}
