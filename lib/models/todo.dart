import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:simple_to_do/constants/enums.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  TodoState state;
  @HiveField(3)
  int routineCount;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime doneAt;
  @HiveField(6)
  Color color;

  Todo(
      {this.id,
      this.name,
      this.state,
      this.routineCount,
      this.createdAt,
      this.doneAt,
      this.color});

  Todo.readError() {
    this.id = null;
    this.name = null;
    this.state = TodoState.readError;
    this.routineCount = null;
    this.createdAt = null;
    this.doneAt = null;
    this.color = null;
  }

//   Map<String, dynamic> toMap() => {
//         'id': id,
//         'name': name,
//         'tags': tags,
//         'state': state,
//         'routineCount': routineCount,
//         'createdAt': createdAt,
//         'doneAt': doneAt,
//         'children': children
//       };
}

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo()
      ..id = reader.read()
      ..name = reader.read()
      ..state = reader.read()
      ..routineCount = reader.read()
      ..createdAt = reader.read()
      ..doneAt = reader.read()
      ..color = reader.read();
  }

  @override
  void write(BinaryWriter writer, Todo todo) {
    writer.write(todo.id);
    writer.write(todo.name);
    writer.write(todo.state);
    writer.write(todo.routineCount);
    writer.write(todo.createdAt);
    writer.write(todo.doneAt);
    writer.write(todo.color);
  }
}
