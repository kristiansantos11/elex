import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  static const routeName = '/register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                child: ElevatedButton(
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
                  onPressed: () => {Navigator.of(context).pop()},
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}