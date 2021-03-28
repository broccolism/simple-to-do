import 'package:hive/hive.dart';
import 'package:simple_to_do/constants/enums.dart';
import 'package:simple_to_do/models/tag.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  TodoState state;
  @HiveField(3)
  int progress;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime expiredAt;
  @HiveField(6)
  List<Todo> children;

  Todo(
      {this.id,
      this.name,
      this.state,
      this.progress,
      this.createdAt,
      this.expiredAt,
      this.children});

  Todo.readError() {
    this.id = null;
    this.name = null;
    this.state = TodoState.readError;
    this.progress = null;
    this.createdAt = null;
    this.expiredAt = null;
    this.children = null;
  }

//   Map<String, dynamic> toMap() => {
//         'id': id,
//         'name': name,
//         'tags': tags,
//         'state': state,
//         'progress': progress,
//         'createdAt': createdAt,
//         'expiredAt': expiredAt,
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
      ..progress = reader.read()
      ..createdAt = reader.read()
      ..expiredAt = reader.read()
      ..children = reader.read();
  }

  @override
  void write(BinaryWriter writer, Todo todo) {
    writer.write(todo.id);
    writer.write(todo.name);
    writer.write(todo.state);
    writer.write(todo.progress);
    writer.write(todo.createdAt);
    writer.write(todo.expiredAt);
    writer.write(todo.children);
  }
}
