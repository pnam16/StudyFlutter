import 'package:flutter/material.dart';

import 'todo_header.dart';
import 'todo_list.dart';

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 5),
      child: Column(
        children: <Widget>[TodoHeader(), TodoList()],
      ),
    );
  }
}
