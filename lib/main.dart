import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_analyzer/views/calendar.dart';
import 'package:workout_analyzer/views/home.dart';
import 'package:workout_analyzer/views/programs.dart';
import 'package:workout_analyzer/views/statistics.dart';
import 'package:workout_analyzer/data/operations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(db: await ensureDatabaseUp()));
}

class App extends StatefulWidget {
  final Database db;
  const App({super.key, required this.db});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    List<Widget> pages = [
      HomePage(db: widget.db),
      const ProgramsPage(),
      const CalendarPage(),
      const StatisticsPage(),
    ];
    return MaterialApp(
        title: "Workout analyzer",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: const TextTheme(
              bodySmall: TextStyle(fontSize: 15.0),
              bodyMedium: TextStyle(fontSize: 18.0)),
          useMaterial3: true,
        ),
        home: DefaultTabController(
            length: pages.length,
            child: Scaffold(
              body: Center(
                child: pages.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Programs"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month), label: "Calendar"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.analytics), label: "Analytics"),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
              ),
            )));
  }
}
