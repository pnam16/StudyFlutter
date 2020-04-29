import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_2/bloc/task_bloc.dart';
import 'package:todo_list_2/event/delete_task_event.dart';
import 'package:todo_list_2/model/task.dart';
import 'package:todo_list_2/screens/modal_screen.dart';

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
                  if (snapshot.data.length == 0)
                    return Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 60),
                              height: MediaQuery.of(context).size.height * 0.62,
                              child: Image.asset('images/waiting.png',
                                  fit: BoxFit.cover)),
                          SizedBox(height: 35),
                          Text(
                            'No tasks added yet...',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 19.0,
                            ),
                          )
                        ]));
                  else
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: Key(snapshot.data[index].id.toString()),
                                  background: Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 15.0),
                                          child: Icon(Icons.delete,
                                              size: 28.0, color: Colors.white)),
                                      color: Colors.red),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (_) {
                                    //swipe to delete task
                                    Provider.of<TaskBloc>(context,
                                            listen: false)
                                        .event
                                        .add(DeleteTaskEvent(
                                            snapshot.data[index]));
//                                    print("deleted");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 30,
                                        color: Colors.black54.withOpacity(.15),
                                      )
                                    ]),
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
                                              snapshot.data[index]
                                                      .description ??
                                                  "",
                                              style: TextStyle(fontSize: 22.0),
                                            ),
                                            SizedBox(height: 3),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index]
                                                          .dueDate ??
                                                      "Null",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontSize: 13),
                                                ),
                                                SizedBox(width: 12),
                                                Text(
                                                  snapshot.data[index]
                                                          .dueTime ??
                                                      "Null",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontSize: 13),
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
                                          onTap: () {
                                            var id = snapshot.data[index].id;
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20))),
                                              context: context,
                                              builder: (_) =>
                                                  ModalScreen(id, true),
                                            );
                                            bloc.event.add(DeleteTaskEvent(
                                                snapshot.data[index]));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  break;
                case ConnectionState.none:
                case ConnectionState.waiting:
                default:
                  return Container(
                      padding: EdgeInsets.only(top: 200.0),
                      width: 69.0,
                      height: 69.0,
                      child: CircularProgressIndicator());
              }
            }));
  }

//  editMode() {
//    return showModalBottomSheet(
//      context: context,
//      builder: (_) => ModalScreen(),
//    );
//  }
}
