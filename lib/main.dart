import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo/screens/home_screen.dart';
import 'package:firebase_todo/screens/login_page.dart';
import 'package:firebase_todo/screens/register_screen.dart';
import 'package:firebase_todo/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: preferences.getBool('isLoggedIn') == true ? '/login' : '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    ),
  );
}
