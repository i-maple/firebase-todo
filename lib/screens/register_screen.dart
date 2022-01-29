import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool seePassword = false;
  String email = '';
  String password = '';
  String error = '';
  String loginText = 'Register';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Log In To Scheduler',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  label: Text('Email'),
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: !seePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.password),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
              RoundedButton(
                onPressed: () async {
                  if (email.isEmpty ||
                      email.length < 8 ||
                      password.length < 6) {
                    setState(() {
                      error = 'Please Enter a valid Email or password';
                    });
                  } else {
                    try {
                      var createUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      setState(() {
                        loginText = 'Registering....';
                      });
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text(
                  loginText,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'OR LOG IN',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
