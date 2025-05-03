import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

class D_WORKOUT_EXCERCISE {
  final int id;
  final int excerciseId;
  final int programWorkoutId;
  final int excerciseNumber;
  final int sets;
  final Uint8List reps;
  final int repsInReserve;
  final int timeBetweenSets;

  D_WORKOUT_EXCERCISE({
    required this.id,
    required this.excerciseId,
    required this.programWorkoutId,
    required this.excerciseNumber,
    required this.sets,
    required this.reps,
    required this.repsInReserve,
    required this.timeBetweenSets,
  });

  Map<String, Object> toMap() {
    return {
      "id": id,
      "excerciseId": excerciseId,
      "programWorkoutId": programWorkoutId,
      "excerciseNumber": excerciseNumber,
      "sets": sets,
      "reps": reps,
      "repsInReserve": repsInReserve,
      "timeBetweenSets": timeBetweenSets,
    };
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE D_WORKOUT_EXCERCISE(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        excerciseId INTEGER, 
        programWorkoutId INTEGER, 
        excerciseNumber INTEGER, 
        sets INTEGER, 
        reps BLOB, 
        repsInReserve INTEGER, 
        timeBetweenSets INTEGER, 
        FOREIGN KEY(excerciseId) REFERENCES R_EXCERCISE(id),
        FOREIGN KEY(programWorkoutId) REFERENCES D_PROGRAM_WORKOUT(id)
      )""");
}

insertExampleExcercise(Database db) async {
  final reps = Uint8List(2);
  reps[0] = 8;
  reps[1] = 10;
  await db.insert(
      "D_WORKOUT_EXCERCISE",
      D_WORKOUT_EXCERCISE(
              id: 0,
              excerciseId: 0,
              programWorkoutId: 0,
              excerciseNumber: 0,
              sets: 4,
              reps: reps,
              repsInReserve: 2,
              timeBetweenSets: 90)
          .toMap());
}
