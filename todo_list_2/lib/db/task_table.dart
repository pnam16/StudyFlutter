import 'package:sqflite/sqflite.dart';
import 'package:todo_list_2/db/task_database.dart';
import 'package:todo_list_2/model/task.dart';

class TaskTable {
  static const TABLE_NAME = 'MyTable';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      description TEXT,
      date TEXT,
      time TEXT,
      isDone INTEGER
      )''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTask(Task task) {
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
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    return List.generate(maps.length, (index) {
      return Task(
        maps[index]['id'],
        maps[index]['description'],
        maps[index]['date'],
        maps[index]['time'],
        maps[index]['isDone'],
      );

//      Task task = Task(
//          _randomInt.nextInt(10000000),
//          _inputDescription,
//          DateFormat.yMMMd().format(_selectedDate).toString(),
//          _selectedTime.format(context),
//          1);
    });
  }
}
