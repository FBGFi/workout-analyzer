import 'package:sqflite/sqflite.dart';

class D_PROGRAM_WORKOUT {
  final int id;
  final int workoutId;
  final int trainingProgramId;
  final int workoutNumber;

  D_PROGRAM_WORKOUT({
    required this.id,
    required this.workoutId,
    required this.trainingProgramId,
    required this.workoutNumber,
  });

  Map<String, Object> toMap() {
    return {
      "id": id,
      "workoutId": workoutId,
      "trainingProgramId": trainingProgramId,
      "workoutNumber": workoutNumber,
    };
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE D_PROGRAM_WORKOUT(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        workoutId INTEGER, 
        trainingProgramId INTEGER, 
        workoutNumber INTEGER, 
        FOREIGN KEY(workoutId) REFERENCES R_WORKOUT(id),
        FOREIGN KEY(trainingProgramId) REFERENCES D_TRAINING_PROGRAM(id)
      )""");
}

insertExampleWorkout(Database db) async {
  await db.insert(
      "D_PROGRAM_WORKOUT",
      D_PROGRAM_WORKOUT(
        id: 0,
        workoutId: 0,
        trainingProgramId: 0,
        workoutNumber: 0,
      ).toMap());
}
