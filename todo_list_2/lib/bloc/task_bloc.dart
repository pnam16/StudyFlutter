import 'dart:async';

import 'package:todo_list_2/base/base_bloc.dart';
import 'package:todo_list_2/base/base_event.dart';
import 'package:todo_list_2/db/task_table.dart';
import 'package:todo_list_2/event/add_task_event.dart';
import 'package:todo_list_2/event/delete_task_event.dart';
import 'package:todo_list_2/event/edit_task_event.dart';
import 'package:todo_list_2/model/task.dart';

class TaskBloc extends BaseBloc {
  StreamController<List<Task>> _taskListStreamController = StreamController();

  Stream<List<Task>> get taskListStream => _taskListStreamController.stream;

  TaskTable _taskTable = TaskTable();

  List<Task> _list = List();

  initData() async {
    _list = await _taskTable.selectAllTask();
    if (_list == null) return;
    _taskListStreamController.sink.add(_list);
  }

  _addTask(Task task) async {
    //insert to db
    await _taskTable.insertTask(task);

    _list.add(task);
    _taskListStreamController.sink.add(_list);
  }

  _deleteTask(Task task) async {
    await _taskTable.deleteTask(task);

    _list.remove(task);
    _taskListStreamController.sink.add(_list);
  }

  void _editTask(Task task) {
    _deleteTask(task);
    _addTask(task);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTaskEvent) {
      _addTask(event.task);
    } else if (event is DeleteTaskEvent) {
      _deleteTask(event.task);
    } else if (event is EditTaskEvent) {
      _editTask(event.task);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _taskListStreamController.close();
  }
}
