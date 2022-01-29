import 'package:firebase_todo/models/shared_prefs.dart';
import 'package:firebase_todo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_todo/models/welcome_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<WelcomeModel> models = [
    WelcomeModel(imageUrl: 'imageUrl', mainText: 'mainText', subText: 'subText')
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('isLoggedIn') == true) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.purpleAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Image.network(
                          myModels[currentIndex].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        radius: 90.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          myModels[currentIndex].subText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Hero(
                        tag: 'Hero',
                        child: RoundedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('isLoggedIn', true);
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Log In',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('isLoggedIn', true);
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: Text(
                          'OR SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentIndex != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex--;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.white,
                                ),
                              )
                            : Text(''),
                        Text(
                          myModels[currentIndex].mainText,
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade200),
                          overflow: TextOverflow.clip,
                        ),
                        currentIndex != myModels.length - 1
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex++;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', true);
                                  Navigator.pushReplacementNamed(
                                      context, '/register');
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
