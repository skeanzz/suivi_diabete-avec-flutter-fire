import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glycefy/screens/Authentification/auth.dart';
import 'package:glycefy/screens/homeScreens/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user != null) {
      return HomeScreen();
    } else {
      return Auth();
    }


  }
}
