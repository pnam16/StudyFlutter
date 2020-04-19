import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todoist_app/bloc/todo_bloc.dart';
import 'package:simple_todoist_app/db/todo_database.dart';

import 'todo/todo_list_container.dart';

//  await TodoDatabase.instanse.init();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instanse.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoListContainer(),
        ),
      ),
    );
  }
}
