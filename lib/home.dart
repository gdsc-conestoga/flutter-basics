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
    return Dismissible(
      key: ValueKey(todoItem),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      onDismissed: (dir) => removeTodoItem(todoItem),
      child: ListTile(
        title: Text(todoItem.title),
        leading: IconButton(
          icon: Icon(
            todoItem.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onPressed: () => toggleTodoItem(todoItem),
        ),
      ),
    );
  }

  void addTodoItem(String value) {
    setState(() {
      _todoItems.add(TodoItem(title: value));
    });
  }

  void toggleTodoItem(TodoItem todoItem) {
    setState(() {
      todoItem.isDone = !todoItem.isDone;
    });
  }

  void removeTodoItem(TodoItem todoItem) {
    setState(() {
      _todoItems.remove(todoItem);
    });
  }
}
