import 'package:sqflite/sqflite.dart';

class R_MUSCLE {
  final int id;
  String name;
  int bodyPercentage;

  R_MUSCLE(
      {required this.id, required this.name, required this.bodyPercentage});
}

createTable(Database db) async {
  await db.execute("""CREATE TABLE R_MUSCLE(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT UNIQUE,
        bodyPercentage INTEGER
      )""");
}
