import 'package:elex/Screen/initial_screen.dart';
import 'package:elex/Screen/login.dart';
import 'package:elex/Screen/register.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Route<Null>? getGenerateRoute(RouteSettings settings){
  final arguments = settings.arguments;

  switch(settings.name){

    case InitialScreen.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: InitialScreen(),
          );
        }
      );

    case Login.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: Login(),
          );
        }
      );

    case Register.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return ListenableProvider(
            create: (context) => animation,
            child: Register(),
          );
        }
      );
  }
  return null;
}