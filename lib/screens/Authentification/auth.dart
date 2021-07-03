import 'package:flutter/material.dart';
import 'package:glycefy/screens/Authentification/login.dart';
import 'package:glycefy/screens/Authentification/register.dart';

class Auth extends StatefulWidget {
  const Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool isToggle = false;
  void toggleScreen(){
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isToggle){
      return Register(toggleScreen:toggleScreen);
    }else{
      return Login(toggleScreen:toggleScreen);
    }
  }
}
