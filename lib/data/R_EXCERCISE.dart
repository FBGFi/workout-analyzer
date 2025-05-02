import 'package:sqflite/sqflite.dart';

class R_EXCERCISE {
  final int id;
  final String name;
  final String description;
  final bool spinalLoad;

  R_EXCERCISE(
      {required this.id,
      required this.name,
      required this.description,
      required this.spinalLoad});

  Map<String, Object> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "spinalLoad": spinalLoad
    };
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_EXCERCISE(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        description TEXT,
        spinalLoad INTEGER
      )""");
}

insertExcercises(Database db) async {
  final batch = db.batch();
  final List<R_EXCERCISE> excercises = [
    R_EXCERCISE(
        id: 0,
        name: "Lat pulldown",
        description: "Done in cable machine",
        spinalLoad: false)
  ];
  for (var excercise in excercises) {
    batch.insert("R_EXCERCISE", excercise.toMap());
  }
  await batch.commit();
}
