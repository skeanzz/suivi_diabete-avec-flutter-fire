import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:glycefy/net/firebase.dart';

class AuthServices with ChangeNotifier{
  bool _isLoading =false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String username,String email, String password) async {
    setLoading(true);
    try{
      UserCredential authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = firebaseAuth.currentUser;
      user.updateProfile(displayName: username);
      userSetup(username);
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to internet");

    }
    catch(e){
      setLoading(false);
      setMessage(e.message);
      print(e);
    }
    notifyListeners();
  }

  Future login(String email, String password) async {
    setLoading(true);
    try{
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to internet");

    }
    catch(e){
      setLoading(false);
      setMessage(e.message);
      print(e);
    }
    notifyListeners();
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  Future reset(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e) {
      setMessage(e.message);
      print(e);
    }
    notifyListeners();
  }

  Future getCurrentUser() async{
    return  firebaseAuth.currentUser;
  }


  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message){
    _errorMessage=message;
    notifyListeners();
  }
  Stream<User> get user =>
      firebaseAuth.authStateChanges().map((event) => event);
}