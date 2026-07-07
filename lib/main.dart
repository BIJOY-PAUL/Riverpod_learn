import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/home_screen.dart';
import 'package:river_pod/satemange.dart';
import 'package:river_pod/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: TodoList()),
    );
  }
}
