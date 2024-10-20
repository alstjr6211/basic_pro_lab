import 'package:basic_project_lab/screens/calculator.dart';


import 'package:flutter/material.dart';
//git checkout -b branch_name 으로 다른 branch로 이동 할 수 있음
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',

      home: Calculator(),
    );
  }
}

