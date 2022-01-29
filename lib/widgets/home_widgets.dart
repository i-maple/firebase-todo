import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeWidgets extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Scheduler',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.deepPurple,
                        size: 26,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('todo').snapshots(),
              builder: (context, snapshot) {
                var todoData = snapshot.data!.docs;
                int index = 1;
                List<Widget> tasksList = [];
                if (todoData != null) {
                  for (var todo in todoData) {
                    var currentIndexInDb = todo.data();
                    bool completedState = todo.get('completed');
                    if (_auth.currentUser?.email == todo.get('email')) {
                      tasksList.add(Card(
                        child: ListTile(
                          leading: Text('Task $index'),
                          title: Text(
                            todo.get('task'),
                            style: TextStyle(
                                decoration: completedState
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          subtitle: Text(todo.get('date')),
                          trailing: Checkbox(
                            onChanged: (value) {
                              _firestore
                                  .collection('todo')
                                  .doc(todo.id)
                                  .update({'completed': !completedState});
                            },
                            value: completedState,
                          ),
                        ),
                      ));
                    }
                    index++;
                  }
                }
                return tasksList.length==0? Card(
                  child: ListTile(
                    title: Text('No Data'),
                  ),
                ):ListView(
                  children: tasksList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
