import 'package:firebase_todo/widgets/add_task_page.dart';
import 'package:firebase_todo/widgets/home_widgets.dart';
import 'package:firebase_todo/widgets/profile_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int _selectedIndex = 0;
var height = 150.0;
var width;

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetsList = [
    HomeWidgets(),
    AddTaskPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Scheduler'),
      ),
      body: widgetsList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

