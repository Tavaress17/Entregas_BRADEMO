import 'package:ex1_aula03/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Login {
  final String _username;
  final String _password;

  Login(String username, String password) : _username = username, _password = password;

  void authenticateAdmin(BuildContext context) {
    if ((_username == 'admin') && (_password == '1234')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Invalid password or username!')));
    return;
  }
}
