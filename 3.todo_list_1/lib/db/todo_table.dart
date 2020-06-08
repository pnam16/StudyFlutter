import 'package:sqflite/sqflite.dart';

import '../model/todo.dart';
import 'todo_database.dart';

class TodoTable {
  static const TABLE_NAME = 'todo';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      content TEXT
    )''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTodo(Todo todo) {
    final db = TodoDatabase.instanse.database;
    return db.insert(
      TABLE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTodo(Todo todo) async {
    final db = TodoDatabase.instanse.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List<Todo>> selectAllTodo() async {
    final db = TodoDatabase.instanse.database;
    final List<Map> maps = await db.query('todo');

    return List.generate(maps.length, (index) {
      return Todo(maps[index]['id'], maps[index]['context']);
    });
  }
}
