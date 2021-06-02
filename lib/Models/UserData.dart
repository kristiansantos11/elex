import 'dart:io';

class UserData{
  String email;
  String password;
  String firstName;
  String lastName;
  String middleInitial;
  int studentNumber;

  UserData({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.middleInitial,
    required this.studentNumber,
  });

  Map<String, dynamic> returnUserData(){
    return{
      'email' : this.email,
      'firstName' : this.firstName,
      'lastName' : this.lastName,
      'middleInitial' : this.middleInitial,
      'studentNumber' : this.studentNumber,
    };
  }
}