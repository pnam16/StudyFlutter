import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_2/bloc/task_bloc.dart';
import 'package:todo_list_2/model/task.dart';

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var bloc = Provider.of<TaskBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Task>>(
            stream: bloc.taskListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(index.toString()),
                                background: Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Icon(Icons.done_outline,
                                          size: 25.0, color: Colors.white),
                                    ),
                                    color: Colors.green),
                                secondaryBackground: Container(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child: Icon(Icons.delete,
                                            size: 28.0, color: Colors.white)),
                                    color: Colors.red),
                                child: Container(
                                  margin:
                                      EdgeInsets.only(right: 5.0, left: 5.0),
                                  child: Card(
                                    child: ListTile(
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data[index].description ??
                                                "~~",
                                            style: TextStyle(fontSize: 25.0),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                snapshot.data[index].dueDate ?? "q",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(width: 12),
                                              Text(
                                                snapshot.data[index].dueTime ?? "q",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                        onTap: null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Container(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Text('Empty',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic)));
                default:
                  return Container(
                      padding: EdgeInsets.only(top: 200.0),
                      width: 69.0,
                      height: 69.0,
                      child: CircularProgressIndicator());
              }
            }));
  }
}
