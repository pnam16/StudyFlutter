import 'package:todo_list_2/base/base_event.dart';
import 'package:todo_list_2/model/task.dart';

class EditTaskEvent extends BaseEvent {
  Task task;

  EditTaskEvent(this.task);
}
