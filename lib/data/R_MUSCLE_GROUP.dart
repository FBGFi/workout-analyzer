import 'package:sqflite/sqflite.dart';

class R_MUSCLE_GROUP {
  final int id;
  String name;

  R_MUSCLE_GROUP({required this.id, required this.name});
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_MUSCLE_GROUP(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT UNIQUE
      )""");
}
