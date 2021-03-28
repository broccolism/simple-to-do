import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_to_do/constants/enums.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/utils/hive_service.dart';
import 'package:simple_to_do/widgets/todo_tile.dart';

class TodoListPage extends StatefulWidget {
  Box hiveBox;
  TodoListPage(this.hiveBox);

  @override
  _TodoListPageState createState() => _TodoListPageState(hiveBox);
}

class _TodoListPageState extends State<TodoListPage> {
  _TodoListPageState(this.hiveBox);
  Box hiveBox;
  HiveService hive;

  List<Todo> todoList;

  @override
  void initState() {
    super.initState();
    this.hive = HiveService(hiveBox);
    // this.todoList = hive.getAllTodo();
    this.todoList = [
      Todo(
          children: [],
          createdAt: DateTime.now(),
          expiredAt: DateTime.now(),
          progress: 50,
          state: TodoState.doing,
          name: "eat con cheese",
          id: 0)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: renderTodoList(),
        ),
      ),
    );
  }

  List<TodoTile> renderTodoList() {
    return this.todoList.map((todo) => TodoTile(todo)).toList();
  }
}
