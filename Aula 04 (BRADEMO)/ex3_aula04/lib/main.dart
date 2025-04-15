import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskPage());
  }
}

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<DateTime> tasks = [];

  void _addTask() {
    setState(() {
      tasks.add(DateTime.now());
    });
  }

  void _removeTask(DateTime taskToRemove) {
    setState(() {
      tasks.remove(taskToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kindacode.com", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            child: Text(
              "View Completed Tasks",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text("You have ${tasks.length} uncompleted tasks"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckBoxCard(
                    dateTime: tasks[index],
                    onTaskCompleted: _removeTask,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class CheckBoxCard extends StatelessWidget {
  final DateTime dateTime;
  final Function(DateTime) onTaskCompleted;

  CheckBoxCard({required this.dateTime, required this.onTaskCompleted});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "Task ${dateTime.toString().split(' ').join('\n')}";

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      color: Colors.amberAccent,
      child: ListTile(
        title: Text(
          formattedDate,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: Icon(Icons.check_box_outline_blank),
          onPressed: () => onTaskCompleted(dateTime),
        ),
      ),
    );
  }
}
