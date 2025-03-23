import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter is Fun!", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          color: Colors.pinkAccent,
          height: 100,
          width: 100,
          margin: const EdgeInsets.all(80.0),
          child: Text("Olá Mundo!"),
        ),
      ),
    );
  }
}