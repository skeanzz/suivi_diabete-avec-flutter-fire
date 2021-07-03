
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> userSetup(String displayName) async {
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  DocumentReference users = FirebaseFirestore.instance.collection('Users').doc(uid);
  users.set({'displayName' : displayName, 'uid':uid});
  print("user add");
  return;

}

Future<void> userGlucoseAdd(double value,DateTime date,TimeOfDay time) async{
  final DateT = DateTime(date.year,date.month,date.day,time.hour,time.minute);
  String Date = DateFormat().format(DateT);

  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  CollectionReference levels = FirebaseFirestore.instance.collection('Users').doc(uid).collection('glucose tests');

  String valueToString= value.toString();

  levels.add({'glucose level ': valueToString , 'Date' : Date });
  print("glucose level add !");
  return;
}

Future<void> userMedicineAdd(String medicine,DateTime date,TimeOfDay time) async{
  final DateT = DateTime(date.year,date.month,date.day,time.hour,time.minute);
  String Date = DateFormat().format(DateT);

  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  CollectionReference levels = FirebaseFirestore.instance.collection('Users').doc(uid).collection('medicine');


  levels.add({'Medicine name ': medicine , 'Date' : Date });
  print(" medicine add !");
  return;
}

Future<void> userPrescriptionAdd(String medicine,String info ,DateTime dateS,DateTime dateE) async{
  String DateS =DateFormat('MM/dd/yyyy').format(dateS);
  String DateE =DateFormat('MM/dd/yyyy').format(dateE);


  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  CollectionReference prescs = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Prescriptions');


  prescs.add({'Medicine name ' : medicine , 'Medicine information' : info,'Start treatment day ' : DateS   ,'End treatment day': DateE });
  print("prescription add !");
  return;
}


