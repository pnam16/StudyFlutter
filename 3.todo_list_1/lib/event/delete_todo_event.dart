import '../base/base_event.dart';
import '../model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  DeleteTodoEvent(this.todo);

  Todo todo;
}
