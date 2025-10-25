import 'package:flutter/material.dart';
import 'package:flutterbatch13/module%208/Grid%20view.dart';
import 'package:flutterbatch13/module%209/test2.dart';
import 'home.dart';
import 'module 7/buttonclass.dart';
import 'module 8/class 2.dart';
import 'module 8/container.dart';
import 'module 8/class.1.input.dart';
import 'module 9/task 1.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      home: Assign10(),
    );
  }}
