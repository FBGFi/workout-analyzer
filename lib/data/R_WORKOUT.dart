import 'package:sqflite/sqflite.dart';

class R_WORKOUT {
  final int id;
  final String name;
  final String description;

  R_WORKOUT({required this.id, required this.name, required this.description});

  Map<String, Object> toMap() {
    return {"id": id, "name": name, "description": description};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_WORKOUT(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        description TEXT
      )""");
}

insertWorkouts(Database db) async {
  final batch = db.batch();
  final List<R_WORKOUT> excercises = [
    R_WORKOUT(id: 0, name: "Pull", description: "Pulling excercises")
  ];
  for (var excercise in excercises) {
    batch.insert("R_WORKOUT", excercise.toMap());
  }
  await batch.commit();
}
