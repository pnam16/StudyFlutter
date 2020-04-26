import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  child: _buidItem(index),
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
                );
              }),
        ),
      ],
    );
  }

  Widget _buidItem(int index) {
    return Container(
      margin: EdgeInsets.only(right: 3.0, left: 3.0),
      child: Card(
        child: ListTile(
          title: Text(
            "Task $index",
            style: TextStyle(fontSize: 25.0),
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
    );
  }
}
