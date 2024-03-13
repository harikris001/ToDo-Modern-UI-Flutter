import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/screens/home_screen.dart';

void main () async {

  // Intializing Hive
  await Hive.initFlutter();

  // Creating DataBase
  await Hive.openBox('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}


