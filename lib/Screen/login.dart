import 'package:elex/Screen/initial_screen.dart';
import 'package:elex/Services/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'package:elex/Services/sizeGetter.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailTextController = TextEditingController();
  final _pwTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void backButtonPressed(BuildContext ctx) {
    Navigator.of(ctx).popUntil(ModalRoute.withName(InitialScreen.routeName));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _pwTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword(ctx) async {
    var _success = true;
    var outMsg;
    if ((_emailTextController.text.isEmpty) ||
        (_pwTextController.text.isEmpty)) {
      outMsg = "Please fill up the necessary fields.";
      return showDialog(
          context: ctx,
          builder: (ctx) {
            return AlertDialog(content: Text(outMsg));
          });
    }

    await context
        .read<AuthenticationService>()
        .signIn(
            email: _emailTextController.text.trim(),
            password: _pwTextController.text.trim())
        .then((_) => {backButtonPressed(context)})
        .catchError((e) => {
              _success = false,
              showDialog(
                  context: ctx,
                  builder: (ctx) {
                    return AlertDialog(content: Text(e.message));
                  })
            });

    if (_success) {
      dynamic scaffold = ScaffoldMessenger.of(ctx);
      await scaffold.showSnackBar(
        SnackBar(
          content: const Text('Logged in'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          50,
                          20,
                          50,
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
                  ]
                )
              ),

                SizedBox(
                  height: getHeight(context)/15,
                ),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => {
                      // TODO: Add login firebase function here
                      _signInWithEmailAndPassword(context)
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
                  ElevatedButton(
                    onPressed: () => {
                      // TODO: Add login firebase function here
                      Navigator.of(context).pop()
                    }, 
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(getWidth(context)/10, getWidth(context)/25)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context)/15)))
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: getWidth(context)/50,
                      ),
                    )
                  ),
                ]
              ),
            ],
          ),
        ),
      )
    );
  }
}