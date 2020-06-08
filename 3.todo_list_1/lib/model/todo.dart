class Todo {
  Todo(this._id, this._content);

  int get id => _id;

  String get content => _content;

  set content(String value) => _content = value;

  set id(int value) => _id = value;

  int _id;
  String _content;

  Map<String, dynamic> toMap() => {'id': _id, 'content': _content};
}
