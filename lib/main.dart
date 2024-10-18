import 'package:flutter/material.dart';
//git checkout -b branch_name 으로 다른 branch로 이동 할 수 있음햣
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

