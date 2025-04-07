import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter By Example",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Image.asset('./assets/home_screen_logo.png', width: 250),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        shape: CircleBorder(),
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.star,
          color: Colors.white,
        ),
      ),
    );
  }
}
