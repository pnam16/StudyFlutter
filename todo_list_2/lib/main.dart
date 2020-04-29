import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_2/bloc/task_bloc.dart';
import 'package:todo_list_2/db/task_database.dart';
import 'package:todo_list_2/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskDatabase.instanse.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TaskBloc>.value(
      value: TaskBloc(),
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
