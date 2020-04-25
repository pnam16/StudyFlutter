import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo_list_2/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _eventStreamController = StreamController();

  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Event false");
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
  }
}
