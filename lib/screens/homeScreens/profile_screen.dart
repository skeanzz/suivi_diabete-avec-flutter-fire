import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glycefy/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class profile extends StatefulWidget {
  const profile({Key key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),

      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: Provider.of<AuthServices>(context).getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return displayUserInformation(context, snapshot);
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget displayUserInformation(context, snapshot) {
  final authData = snapshot.data;

  return Column(

    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Username: ${authData.displayName}",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Email: ${authData.email}",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Profile Created: ${DateFormat('MM/dd/yyyy').format(authData.metadata.creationTime)}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}
