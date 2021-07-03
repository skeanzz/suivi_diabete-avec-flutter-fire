import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glycefy/screens/wrapper.dart';
import 'package:glycefy/services/auth_services.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthServices>.value(value: AuthServices()),
          StreamProvider<User>.value(
              value: AuthServices().user, initialData: null)
        ],
        child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.lightBlue),
            debugShowCheckedModeBanner: false,
            home: Wrapper()));
    /* return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget() ;


        } else if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        } else {
          return  Loading();

        }
      },
    );*/
  }
}

/*class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("Something went wrong !")],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
*/