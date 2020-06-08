import 'dart:async';
import 'dart:math';

import '../base/base_bloc.dart';
import '../base/base_event.dart';
import '../db/todo_table.dart';
import '../event/add_todo_event.dart';
import '../event/delete_todo_event.dart';
import '../model/todo.dart';

class TodoBloc extends BaseBloc {
  final StreamController<List<Todo>> _listStreamController = StreamController();

  Stream<List<Todo>> get todoListStream => _listStreamController.stream;

  final TodoTable _todoTable = TodoTable();

  final _randomInt = Random();

  List<Todo> _list = [];

  Future<void> initData() async {
    _list = await _todoTable.selectAllTodo();
    // ignore: always_put_control_body_on_new_line
    if (_list == null) return;
    _listStreamController.sink.add(_list);
  }

  // ignore: always_declare_return_types
  _addTodo(Todo todo) async {
    //insert to db
    await _todoTable.insertTodo(todo);

    _list.add(todo);
    _listStreamController.sink.add(_list);
  }

  // ignore: always_declare_return_types
  _deleteTodo(Todo todo) async {
    await _todoTable.deleteTodo(todo);

    _list.remove(todo);
    _listStreamController.sink.add(_list);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      // ignore: omit_local_variable_types
      final Todo todo = Todo(_randomInt.nextInt(100000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _listStreamController.close();
  }
}
