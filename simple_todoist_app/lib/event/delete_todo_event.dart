import 'package:simple_todoist_app/base/base_event.dart';
import 'package:simple_todoist_app/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);

}
