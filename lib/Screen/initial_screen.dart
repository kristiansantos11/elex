import 'package:elex/Screen/main_menu.dart';
import 'package:elex/Screen/login.dart';
import 'package:elex/Screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  User? firebaseUser;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser != null){
      return MainMenu();
    } else {
      return StartScreen();
    }
  }
}