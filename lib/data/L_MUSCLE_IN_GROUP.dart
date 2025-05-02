import 'package:sqflite/sqflite.dart';

class L_MUSCLE_IN_GROUP {
  final int muscleId;
  final int muscleGroupId;

  L_MUSCLE_IN_GROUP({required this.muscleId, required this.muscleGroupId});
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE L_MUSCLE_IN_GROUP(
        muscleId INTEGER, 
        muscleGroupId INTEGER,
        PRIMARY KEY(muscleId, muscleGroupId),
        FOREIGN KEY(muscleId) REFERENCES R_MUSCLE(id),
        FOREIGN KEY(muscleGroupId) REFERENCES R_MUSCLE_GROUP(id)
      )""");
}
