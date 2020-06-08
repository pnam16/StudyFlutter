import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/todo_bloc.dart';
import '../event/delete_todo_event.dart';
import '../model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                snapshot.data[index].content ?? 'aa',
                                style: const TextStyle(fontSize: 22),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  bloc.event.add(
                                      DeleteTodoEvent(snapshot.data[index]));
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }));
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Container(
                      padding: const EdgeInsets.only(top: 200),
                      child: Text('Empty',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic)));
                default:
                  return Container(
                      padding: const EdgeInsets.only(top: 200),
                      width: 69,
                      height: 69,
                      child: const CircularProgressIndicator());
              }
            }));
  }
}
