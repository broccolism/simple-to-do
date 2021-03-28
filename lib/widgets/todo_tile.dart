import 'package:flutter/material.dart';
import 'package:simple_to_do/models/tag.dart';
import 'package:simple_to_do/models/todo.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;
  TodoTile(this.todo);

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  Todo todo;

  @override
  void initState() {
    super.initState();
    this.todo = widget.todo;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(todo.progress.toString()),
            Text(todo.name),
          ],
        ),
        Row(
          children: [
            Text(todo.createdAt.toString()),
            Text(todo.expiredAt.toString()),
          ],
        )
      ],
    );
  }
}
