import 'dart:async';

class MyBloc {
  int counter = 0;
  StreamController _streamController = StreamController<int>();

  Stream get couterStream => _streamController.stream;

  void increment() {
    counter++;
    _streamController.sink.add(counter);
  }

  void dispose() {
    _streamController.close();
  }
}
