import 'package:sqflite/sqflite.dart';

class R_MUSCLE_GROUP {
  final int id;
  String name;
  double bodyPercentage;

  R_MUSCLE_GROUP(
      {required this.id, required this.name, required this.bodyPercentage});

  Map<String, Object> toMap() {
    return {"id": id, "name": name, "bodyPercentage": bodyPercentage};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_MUSCLE_GROUP(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT UNIQUE,
        bodyPercentage DOUBLE
      )""");
}

insertMuscleGroups(Database db) async {
  final List<R_MUSCLE_GROUP> muscleGroups = [
    R_MUSCLE_GROUP(id: 0, name: "Legs", bodyPercentage: 50),
    R_MUSCLE_GROUP(id: 1, name: "Posterior chain", bodyPercentage: 45),
    R_MUSCLE_GROUP(id: 2, name: "Back", bodyPercentage: 12.5),
    R_MUSCLE_GROUP(id: 3, name: "Chest", bodyPercentage: 6),
    R_MUSCLE_GROUP(id: 4, name: "Arms", bodyPercentage: 12),
    R_MUSCLE_GROUP(id: 5, name: "Core", bodyPercentage: 10.5),
    R_MUSCLE_GROUP(id: 6, name: "Shoulders", bodyPercentage: 6.5),
    R_MUSCLE_GROUP(id: 7, name: "Upper back", bodyPercentage: 10),
  ];
  final batch = db.batch();
  for (var muscleGroup in muscleGroups) {
    batch.insert("R_MUSCLE_GROUP", muscleGroup.toMap());
  }
  await batch.commit();
}
