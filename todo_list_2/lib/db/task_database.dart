import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_2/db/task_table.dart';

class TaskDatabase {
  static const DB_NAME = 'task.db';
  static const DB_VERSION = 1; ////////////
  static Database _database;

  TaskDatabase._internal();

  static final TaskDatabase instanse = TaskDatabase._internal();

  Database get database => _database;

  static const initScripts = [
    TaskTable.CREATE_TABLE_QUERY
  ]; //hold many init script
  static const migrationScripts = [TaskTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      initScripts.forEach((script) async => await db.execute(script));
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((script) async => await db.execute(script));
    }, version: DB_VERSION);
  }
}
