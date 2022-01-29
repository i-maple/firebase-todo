import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  String task = '';
  String description = '';
  String date = '';

  final FirebaseFirestore store = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add a Schedule',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple, fontSize: 30.0),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            onChanged: (value) {
              task = value;
            },
            decoration:
                InputDecoration(hintText: 'Task', icon: Icon(Icons.list)),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(
                hintText: 'Description', icon: Icon(Icons.description)),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              date = value;
            },
            decoration:
                InputDecoration(hintText: 'Date', icon: Icon(Icons.date_range)),
          ),
          SizedBox(
            height: 30,
          ),
          RoundedButton(
            child: Text(
              'Add Into List',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () async {
              try {
                await store.collection('todo').add(
                  {
                    'email': _auth.currentUser?.email,
                    'task': task,
                    'desc': description,
                    'date': date,
                    'completed' : false,
                  },
                );
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
    );
  }
}
