import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  final Database db;
  const HomePage({super.key, required this.db});

  printAll() async {
    final results = await db.query("R_MUSCLE");
    print(results);
  }

  @override
  Widget build(context) {
    printAll();
    return const Text("Home page");
  }
}
