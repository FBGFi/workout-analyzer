import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_analyzer/data/R_MUSCLE.dart' as r_muscle;
import 'package:workout_analyzer/data/R_MUSCLE_GROUP.dart' as r_muscle_group;
import 'package:workout_analyzer/data/R_EXCERCISE.dart' as r_excercise;
import 'package:workout_analyzer/data/R_WORKOUT.dart' as r_workout;

import 'package:workout_analyzer/data/D_TRAINING_PROGRAM.dart'
    as d_training_program;
import 'package:workout_analyzer/data/D_PROGRAM_WORKOUT.dart'
    as d_program_workout;
import 'package:workout_analyzer/data/D_WORKOUT_EXCERCISE.dart'
    as d_workout_excercise;

import 'package:workout_analyzer/data/L_MUSCLE_IN_GROUP.dart'
    as l_muscle_in_group;

Future<Database> ensureDatabaseUp() async {
  final databasePath = join(await getDatabasesPath(), "workouts_database.db");
  // TODO remove after datamodel done
  await deleteDatabase(databasePath);
  final db = await openDatabase(databasePath, onCreate: (db, version) async {
    print("Creating tables...");
    await r_muscle.createTable(db);
    await r_muscle.insertMuscles(db);
    await r_muscle_group.createTable(db);
    await r_muscle_group.insertMuscleGroups(db);
    await r_excercise.createTable(db);
    await r_excercise.insertExcercises(db);
    await r_workout.createTable(db);
    await r_workout.insertWorkouts(db);

    await d_training_program.createTable(db);
    await d_training_program.insertExampleTrainingProgram(db);
    await d_program_workout.createTable(db);
    await d_program_workout.insertExampleWorkout(db);
    await d_workout_excercise.createTable(db);
    await d_workout_excercise.insertExampleExcercise(db);

    await l_muscle_in_group.createTable(db);
    await l_muscle_in_group.linkMusclesToGroups(db);
  }, version: 1);
  return db;
}
