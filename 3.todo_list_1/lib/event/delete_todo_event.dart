import 'package:todo_list_1/base/base_event.dart';
import 'package:todo_list_1/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);
}
