import 'package:sqflite/sqflite.dart';

class R_TRAINING_PROGRAM {
  final int id;
  final String name;
  final String description;

  R_TRAINING_PROGRAM(
      {required this.id, required this.name, required this.description});

  Map<String, Object> toMap() {
    return {"id": id, "name": name, "description": description};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_TRAINING_PROGRAM(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT UNIQUE,
        description TEXT
      )""");
}

insertTrainingPrograms(Database db) async {
  await db.insert(
      "R_TRAINING_PROGRAM",
      R_TRAINING_PROGRAM(
              id: 0, name: "Push-pull-legs", description: "3-day split")
          .toMap());
}
