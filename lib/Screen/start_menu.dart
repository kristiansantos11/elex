import 'package:flutter/material.dart';
import 'package:elex/Services/sizeGetter.dart';

class StartMenu extends StatefulWidget {
  @override
  _StartMenuState createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {

  final _emailTextController = TextEditingController();
  final _pwTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "elex",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Nexa",
                fontWeight: FontWeight.w700,
                fontSize: getWidth(context)/10,
              )
            ),

            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getWidth(context)/4,
                      20,
                      getWidth(context)/4,
                      10),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your e-mail';
                      }
                      return null;
                    },
                    controller:
                        _emailTextController,
                    cursorColor: Color(0xfff77272),
                    style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            getWidth(context)/45,
                        color: Colors.white54
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(
                              30, 0, 30, 0),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.white24),
                      hintText: "Email",
                      fillColor: Colors.grey[600],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getWidth(context)/4,
                      0,
                      getWidth(context)/4,
                      0),
                  child: TextFormField(
                    cursorColor: Color(0xfff77272),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _pwTextController,
                    style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            getWidth(context)/45,
                        color: Colors.white54),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(
                              30, 0, 30, 0),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.white24),
                      hintText: "Password",
                      fillColor: Colors.grey[600],
                    ),
                  ),
                ),
              ])),

              SizedBox(
                height: getHeight(context)/15,
              ),

            ElevatedButton(
              onPressed: () => {
                // TODO: Add login firebase function here
              }, 
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(getWidth(context)/10, getWidth(context)/25)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context)/15)))
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: getWidth(context)/50,
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}