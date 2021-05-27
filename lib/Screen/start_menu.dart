import 'package:flutter/material.dart';

class StartMenu extends StatefulWidget {
  @override
  _StartMenuState createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {

  List<String> texts = ["Hiii!", "Welcome!", "Eleksyon!", "HIIIIIIII!"];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text(
              texts[counter],
              style: TextStyle(
                color: Colors.black
              )
            ),

            ElevatedButton(
              onPressed: () => {
                setState((){
                  if(counter+1 == texts.length){
                    counter = 0;
                  } else {
                    counter++;
                  }
                })
              }, 
              child: Text(
                "Hello!"
              )
            ),
          ],
        ),
      )
    );
  }
}