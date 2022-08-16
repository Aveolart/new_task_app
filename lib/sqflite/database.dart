import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_app/sqflite/database_model.dart';

class DatabaseManager {
  Future<Database> database() async {
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    return openDatabase(
      join(await getDatabasesPath(), 'taskDatabase.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
      },
      version: 1,
    );
  }

  Future<void> updateTask(int id, String title, String description) async {
    // Get a reference to the database.
    final db = await database();

    // Update the given Dog.
    await db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
    await db.rawUpdate(
        "UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }
  Future<void> deleteTask(int id) async {
    // Get a reference to the database.
    final db = await database();

    // Update the given Dog.
    await db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
    
  }

  Future<void> insertTask(TaskApp task) async {
    Database db = await database();
    await db.insert("tasks", task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TaskApp>> getTasks() async {
    final db = await database();
    final List<Map<String, dynamic>> taskMaps = await db.query('tasks');
    return List.generate(taskMaps.length, (index) {
      return TaskApp(
          id: taskMaps[index]["id"],
          title: taskMaps[index]["title"],
          description: taskMaps[index]["description"]);
    });
  }
}
