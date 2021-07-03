import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class glycemieview extends StatefulWidget {
  const glycemieview({Key key}) : super(key: key);

  @override
  _glycemieviewState createState() => _glycemieviewState();
}

class _glycemieviewState extends State<glycemieview> {
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Glucose Tests view"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection('glucose tests')
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
                subtitle: new Text(data['glucose level ']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
