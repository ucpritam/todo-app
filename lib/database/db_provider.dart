import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/model/task_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider instance = DBProvider._();
  static Database _database;

  Future<Database> get database async => _database ?? await _initDataBase();

  Future<Database> _initDataBase() async {
    return await openDatabase(join(await getDatabasesPath(), 'toDo.db'),
        onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE todoTaskTable(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, status INTEGER)
      ''');
    }, version: 1);
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> result = await db.query('todoTaskTable');
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Task.fromMap(taskMap));
    });
    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.database;
    final int result = await db.insert('todoTaskTable', task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await this.database;
    final int result = await db.update(
      'todoTaskTable',
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
    return result;
  }
}
