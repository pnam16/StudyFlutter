class Todo {
  int _id;
  String _content;

  Todo(this._id, this._content);

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
