import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/todo_bloc.dart';
import '../event/add_todo_event.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txtTodoController = TextEditingController();
    final bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: const InputDecoration(hintText: 'Add todo'),
          ),
        ),
        const SizedBox(width: 20),
        RaisedButton.icon(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtTodoController.text));
//            print(txtTodoController.text);
          },
          label: Text(
            'Add',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          icon: Icon(Icons.note_add, color: Colors.white),
        )
      ],
    );
  }
}
