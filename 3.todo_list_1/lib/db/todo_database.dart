import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'todo_table.dart';

class TodoDatabase {
  // ignore: constant_identifier_names
  static const DB_NAME = 'todo.db';

  // ignore: constant_identifier_names
  static const DB_VERSION = 1;
  static Database _database;

  // ignore: sort_constructors_first
  TodoDatabase._internal();

  static final TodoDatabase instanse = TodoDatabase._internal();

  Database get database => _database;

  static const initScripts = [
    TodoTable.CREATE_TABLE_QUERY
  ]; //hold many init script
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  // ignore: type_annotate_public_apis, always_declare_return_types
  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      initScripts.forEach((script) async => db.execute(script));
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((script) async => db.execute(script));
    }, version: DB_VERSION);
  }
}
