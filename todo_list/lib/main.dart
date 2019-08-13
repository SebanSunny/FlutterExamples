import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      if(task.length > 0) {
        _todoItems.add(task);
      }
    });
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promtRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark "${_todoItems[index]}" as done?'),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('MARK AS DONE'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  Widget _builToDoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildToDoItem(_todoItems[index], index);
        }
      }
    );
  }

  Widget _buildToDoItem(String toDoText, int index) {
    return ListTile(
      title: Text(toDoText),
      onTap: () => _promtRemoveTodoItem(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Todo List'),
      ),
      body: _builToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add new Todo',
        child: Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add a new task'),
            ),
            body: TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter a new to-do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
      )
    );
  }
}
