import 'package:elex/Screen/register.dart';
import 'package:flutter/material.dart';
import 'package:elex/Services/sizeGetter.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({ Key? key }) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "elex",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Nexa",
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(context)/12,
                    )
                  ),



                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Hero(
                        tag: 'register',
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(18.0),
                            ),
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                    MaterialStateProperty.all<Color>(Color.fromARGB(255,255,131,131)),
                                  overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState>states) {
                                        if (states.contains(MaterialState.hovered)) return Colors.red[500]!;
                                        if (states.contains(MaterialState.pressed)) return Colors.white;
                                        return Color.fromARGB(255,255,131,131); // Defer to the widget's default.
                                      }
                                    ),
                                  shape:
                                      MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(
                                            getWidth(context)/5),
                                  )),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(150, 35)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(Register.routeName);
                                },
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        3, 3, 3, 0),
                                    child: Text("REGISTER",
                                        style: TextStyle(
                                          fontFamily:
                                              'Proxima Nova',
                                          fontStyle:
                                              FontStyle.normal,
                                          fontSize:
                                              24,
                                          color: Colors.white,
                                          fontWeight:
                                              FontWeight.bold,
                                          letterSpacing: 1.5,
                                        ))))),
                      ),
                      SizedBox(
                        height: getHeight(context) / 900,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          1,
                          0,
                          10
                        ),
                        child: Hero(
                            tag: 'login',
                          child: Container(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(
                                        Color.fromARGB(255,255,131,131)),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState>states) {
                                        if (states.contains(MaterialState.hovered)) return Colors.red[500]!;
                                        if (states.contains(MaterialState.pressed)) return Colors.white;
                                        return Color.fromARGB(255,255,131,131); // Defer to the widget's default.
                                      }
                                    ),
                                minimumSize:
                                    MaterialStateProperty.all(Size(150,35)),
                                shape:
                                    MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/login');
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    3, 3, 3, 0),
                                child: Text("LOGIN",
                                  style: TextStyle(
                                    fontFamily:
                                        'Proxima Nova',
                                    fontStyle:
                                        FontStyle.normal,
                                    fontSize:
                                        24,
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                    letterSpacing: 1.5,
                                  )
                                )
                              )
                            ),
                          )
                        ),
                      )

                    ]
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}