import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/model/task_model.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider instance = DBProvider._();

  static Database? _database;

  //Connect to Database
  Future<Database> get database async {
    final dbpath = await getDatabasesPath(); //location of database
    const dbname = 'todo.db'; //name of database
    final path = join(dbpath, dbname); //creating full path
    _database = await openDatabase(path,
        version: 1, onCreate: _createDB); //open the connection

    return _database!;
  }

  //Create Tables
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE todoTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          status INTEGER
        )
      ''');
  }

  //Add
  Future<void> insertTask(Task task) async {
    final db = await database; //get the connection to database

    //insert task
    await db.insert(
      'todoTable',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, //replace duplicate entry
    );
  }

  //Delete
  Future<void> deleteTask(Task task) async {
    final db = await database;

    await db.delete(
      'todoTable',
      where: 'id == ?', //condition to check id
      whereArgs: [task.id],
    );
  }

  //Update
  Future<void> updateTask(Task task) async {
    final db = await database;

    await db.update(
      'todoTable',
      task.toMap(),
      where: 'id == ?',
      whereArgs: [task.id],
    );
  }

  //Fetch all data from database
  Future<List<Task>> getTask() async {
    final db = await database;

    //query database and save the task as list of maps
    List<Map<String, dynamic>> result = await db.query(
      'todoTable',
      orderBy: 'id DESC',
    );

    //convert result from list of maps to list of task
    return List.generate(
        result.length,
        (i) => Task(
              id: result[i]['id'],
              title: result[i]['title'],
              status: result[i]['status'] == 1
                  ? true
                  : false, //convert integer to bool
            ));
  }
}
