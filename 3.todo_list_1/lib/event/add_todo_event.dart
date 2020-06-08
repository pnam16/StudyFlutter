import '../base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  AddTodoEvent(this.content);

  String content;
}
