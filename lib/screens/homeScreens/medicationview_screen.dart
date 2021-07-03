import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class medicationview extends StatefulWidget {
  const medicationview ({Key key}) : super(key: key);

  @override
  _medicationviewState createState() => _medicationviewState();
}

class _medicationviewState extends State<medicationview > {
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medication view"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection('medicine')
            .orderBy('Date', descending: true)
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("No Data !!");
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
              return new ListTile(
                title: new Text(data['Date']),
                subtitle: new Text(data['Medicine name ']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
