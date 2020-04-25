import 'package:sqflite/sqflite.dart';
import 'package:todo_list_2/db/task_database.dart';
import 'package:todo_list_2/model/task.dart';

class TaskTable {
  static const TABLE_NAME = 'table';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      content TEXT
    )''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTodo(Task task) {
    final Database db = TaskDatabase.instanse.database;
    return db.insert(
      TABLE_NAME,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(Task task) async {
    final Database db = TaskDatabase.instanse.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [task.id]);
  }

  Future<List<Task>> selectAllTask() async {
    final Database db = TaskDatabase.instanse.database;
    final List<Map<String, dynamic>> maps = await db.query('table');

    return List.generate(maps.length, (index) {
      return Task(
        maps[index]['id'],
        maps[index]['description'],
        maps[index]['dueDate'],
        maps[index]['dueTime'],
        maps[index]['isDone'],
      );
    });
  }
}
