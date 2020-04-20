import 'package:simple_todolist_app/base/base_event.dart';
import 'package:simple_todolist_app/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);

}
