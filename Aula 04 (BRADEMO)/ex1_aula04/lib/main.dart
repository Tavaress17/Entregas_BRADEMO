import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void showSnackbar(BuildContext context) {
    final nameText = nameController.text;
    final phoneText = phoneController.text;
    final dobText = dobController.text;

    if (nameText != "" && phoneText != "" && dobText != "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Name: $nameText, Phone: $phoneText and Dob: $dobText.",
          ),
          duration: Duration(seconds: 2),
        ),
      );
      dispose();
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Some data is missing.",
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form Demo", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(labelText: "Phone"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  Expanded(
                    child: TextField(
                      controller: dobController,
                      decoration: InputDecoration(labelText: "Dob"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () => showSnackbar(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    elevation: 0,
                  ),
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
