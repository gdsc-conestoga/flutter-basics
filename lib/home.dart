import 'package:flutter/material.dart';

class TodoItem {
  String title;
  bool isDone;

  TodoItem({
    required this.title,
    this.isDone = false,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TodoItem> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(onSubmitted: addTodoItem),
          Flexible(
            child: ListView(
              children: _todoItems.map(buildTodoItem).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTodoItem(TodoItem todoItem) {
    return ListTile(
      title: Text(todoItem.title),
      leading: IconButton(
        icon: Icon(
          todoItem.isDone ? Icons.check_box_outline_blank : Icons.check_box,
        ),
        onPressed: () => toggleTodoItem(todoItem),
      ),
    );
  }

  void addTodoItem(String value) {
    setState(() {
      _todoItems.add(TodoItem(title: value));
    });
  }

  toggleTodoItem(TodoItem todoItem) {
    setState(() {
      todoItem.isDone = !todoItem.isDone;
    });
  }
}
