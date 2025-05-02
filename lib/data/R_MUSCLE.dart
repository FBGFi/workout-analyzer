import 'package:sqflite/sqflite.dart';

class R_MUSCLE {
  final int id;
  String name;
  double bodyPercentage;

  R_MUSCLE(
      {required this.id, required this.name, required this.bodyPercentage});

  Map<String, Object> toMap() {
    return {"id": id, "name": name, "bodyPercentage": bodyPercentage};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_MUSCLE(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT UNIQUE,
        bodyPercentage DOUBLE
      )""");
}

insertMuscles(Database db) async {
  final List<R_MUSCLE> muscles = [
    R_MUSCLE(id: 0, name: "Quads", bodyPercentage: 18),
    R_MUSCLE(id: 1, name: "Glutes", bodyPercentage: 14),
    R_MUSCLE(id: 2, name: "Hamstrings", bodyPercentage: 11),
    R_MUSCLE(id: 3, name: "Calves", bodyPercentage: 7),
    R_MUSCLE(id: 4, name: "Pec major", bodyPercentage: 5),
    R_MUSCLE(id: 5, name: "Lats", bodyPercentage: 6),
    R_MUSCLE(id: 6, name: "Traps", bodyPercentage: 4.5),
    R_MUSCLE(id: 7, name: "Deltoids", bodyPercentage: 4),
    R_MUSCLE(id: 8, name: "Biceps", bodyPercentage: 2.5),
    R_MUSCLE(id: 9, name: "Triceps", bodyPercentage: 2.5),
    R_MUSCLE(id: 10, name: "Forearms", bodyPercentage: 3),
    R_MUSCLE(id: 11, name: "Abs", bodyPercentage: 4),
    R_MUSCLE(id: 12, name: "Lower back", bodyPercentage: 3.5),
    R_MUSCLE(id: 13, name: "Pec minor", bodyPercentage: 1),
  ];
  final batch = db.batch();
  for (var muscle in muscles) {
    batch.insert("R_MUSCLE", muscle.toMap());
  }
  await batch.commit();
}
