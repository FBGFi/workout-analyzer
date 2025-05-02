import 'package:sqflite/sqflite.dart';

class L_MUSCLE_IN_GROUP {
  final int muscleId;
  final int muscleGroupId;
  final double groupPercentage;

  L_MUSCLE_IN_GROUP(
      {required this.muscleId,
      required this.muscleGroupId,
      required this.groupPercentage});

  Map<String, Object> toMap() {
    return {
      "muscleId": muscleId,
      "muscleGroupId": muscleGroupId,
      "groupPercentage": groupPercentage
    };
  }
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE L_MUSCLE_IN_GROUP(
        muscleId INTEGER, 
        muscleGroupId INTEGER,
        groupPercentage DOUBLE,
        PRIMARY KEY(muscleId, muscleGroupId),
        FOREIGN KEY(muscleId) REFERENCES R_MUSCLE(id),
        FOREIGN KEY(muscleGroupId) REFERENCES R_MUSCLE_GROUP(id)
      )""");
}

linkMusclesToGroups(Database db) async {
  final List<L_MUSCLE_IN_GROUP> musclesInGroups = [
    // Legs
    L_MUSCLE_IN_GROUP(muscleGroupId: 0, muscleId: 0, groupPercentage: 36),
    L_MUSCLE_IN_GROUP(muscleGroupId: 0, muscleId: 1, groupPercentage: 28),
    L_MUSCLE_IN_GROUP(muscleGroupId: 0, muscleId: 2, groupPercentage: 22),
    L_MUSCLE_IN_GROUP(muscleGroupId: 0, muscleId: 3, groupPercentage: 14),
    // Posterior chain
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 1, groupPercentage: 30),
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 2, groupPercentage: 25),
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 3, groupPercentage: 10),
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 12, groupPercentage: 15),
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 5, groupPercentage: 10),
    L_MUSCLE_IN_GROUP(muscleGroupId: 1, muscleId: 6, groupPercentage: 10),
    // Back
    L_MUSCLE_IN_GROUP(muscleGroupId: 2, muscleId: 5, groupPercentage: 40),
    L_MUSCLE_IN_GROUP(muscleGroupId: 2, muscleId: 6, groupPercentage: 30),
    L_MUSCLE_IN_GROUP(muscleGroupId: 2, muscleId: 12, groupPercentage: 30),
    // Chest
    L_MUSCLE_IN_GROUP(muscleGroupId: 3, muscleId: 4, groupPercentage: 90),
    L_MUSCLE_IN_GROUP(muscleGroupId: 3, muscleId: 13, groupPercentage: 10),
    // Arms
    L_MUSCLE_IN_GROUP(muscleGroupId: 4, muscleId: 8, groupPercentage: 25),
    L_MUSCLE_IN_GROUP(muscleGroupId: 4, muscleId: 9, groupPercentage: 25),
    L_MUSCLE_IN_GROUP(muscleGroupId: 4, muscleId: 10, groupPercentage: 25),
    L_MUSCLE_IN_GROUP(muscleGroupId: 4, muscleId: 7, groupPercentage: 25),
    // Core
    L_MUSCLE_IN_GROUP(muscleGroupId: 5, muscleId: 11, groupPercentage: 70),
    L_MUSCLE_IN_GROUP(muscleGroupId: 5, muscleId: 12, groupPercentage: 30),
    // Shoulders
    L_MUSCLE_IN_GROUP(muscleGroupId: 6, muscleId: 7, groupPercentage: 85),
    L_MUSCLE_IN_GROUP(muscleGroupId: 6, muscleId: 6, groupPercentage: 15),
    // Upper back
    L_MUSCLE_IN_GROUP(muscleGroupId: 7, muscleId: 6, groupPercentage: 65),
    L_MUSCLE_IN_GROUP(muscleGroupId: 7, muscleId: 5, groupPercentage: 35),
  ];
  final batch = db.batch();
  for (var muscle in musclesInGroups) {
    batch.insert("L_MUSCLE_IN_GROUP", muscle.toMap());
  }
  await batch.commit();
}
