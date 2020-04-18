import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todoist_app/bloc/todo_bloc.dart';
import 'package:simple_todoist_app/event/delete_todo_event.dart';
import 'package:simple_todoist_app/model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(

                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data[index].content,
                            style: TextStyle(fontSize: 22.0),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              bloc.event.add(DeleteTodoEvent(snapshot.data[index]));
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        );
                      });
                case ConnectionState.none:
                default:
                  return Center(
                    child: Container(
                      width: 69.0,
                      height: 69.0,
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            }));
  }
}
