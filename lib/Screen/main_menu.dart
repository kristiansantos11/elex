import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              Text("hello"),
              SizedBox(height: 100),
              Text("hello"),
              SizedBox(height: 100),
              Text("hello"),
            ],
          ),
        ],
      ),
    );
  }
}