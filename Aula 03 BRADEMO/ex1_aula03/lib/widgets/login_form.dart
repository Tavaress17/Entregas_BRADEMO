import 'package:ex1_aula03/models/login.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameInput = TextEditingController();
    final TextEditingController passwordInput = TextEditingController();

    void login() {
      final username = usernameInput.text;
      final password = passwordInput.text;

      final userLogin = Login(username, password);

      userLogin.authenticateAdmin(context);
    }

    return Column(
      children: [
        SizedBox(
          width: 380,
          child: TextField(
            controller: usernameInput,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Username",
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 380,
          child: TextField(
            obscureText: true,
            controller: passwordInput,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 280,
          height: 45,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.blue,
            onPressed: login,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
