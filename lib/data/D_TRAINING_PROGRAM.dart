import 'package:sqflite/sqflite.dart';

class D_TRAINING_PROGRAM {
  final int id;
  final int trainingProgramId;
  final int active;

  D_TRAINING_PROGRAM(
      {required this.id,
      required this.trainingProgramId,
      required this.active});

  Map<String, Object> toMap() {
    return {"id": id, "trainingProgramId": trainingProgramId, "active": active};
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE D_TRAINING_PROGRAM(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        trainingProgramId INTEGER, 
        active INTEGER, 
        FOREIGN KEY(trainingProgramId) REFERENCES R_TRAINING_PROGRAM(id)
      )""");
}

insertExampleTrainingProgram(Database db) async {
  await db.insert("D_TRAINING_PROGRAM",
      D_TRAINING_PROGRAM(id: 0, trainingProgramId: 0, active: 1).toMap());
}
