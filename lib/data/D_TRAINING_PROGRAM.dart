import 'package:sqflite/sqflite.dart';

class D_TRAINING_PROGRAM {
  final int id;
  final String name;
  final String description;

  D_TRAINING_PROGRAM(
      {required this.id, required this.name, required this.description});

  Map<String, Object> toMap() {
    return {"id": id, "name": name, "description": description};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE D_TRAINING_PROGRAM(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        description TEXT
      )""");
}

insertExampleTrainingProgram(Database db) async {
  await db.insert(
      "D_TRAINING_PROGRAM",
      D_TRAINING_PROGRAM(
              id: 0, name: "Push-pull-legs", description: "3-day split")
          .toMap());
}
