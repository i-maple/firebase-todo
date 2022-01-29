import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: ListView(
        children: [
          Card(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 30,
                    child: Text(
                      'N',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          _auth.currentUser!.email.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Log Out'), Icon(Icons.logout)],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
