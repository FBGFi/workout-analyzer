import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_analyzer/data/operations.dart';

class ProgramsPage extends StatefulWidget {
  final Database db;
  const ProgramsPage({super.key, required this.db});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  List<TrainingProgram>? trainingPrograms;

  @override
  void initState() {
    super.initState();
    getExistingTrainingPrograms(widget.db).then((programs) {
      setState(() {
        trainingPrograms = programs;
      });
    });
  }

  @override
  Widget build(context) {
    if (trainingPrograms != null) {
      return ListView(
          children: trainingPrograms!
              .map((entry) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(entry.name),
                        Text(entry.description),
                        Text(entry.active.toString()),
                      ],
                    ),
                  ))
              .toList());
    }
    return const Text("Loading...");
  }
}
