import 'package:flutter/material.dart';
import 'package:glycefy/screens/homeScreens/medication_screen.dart';
import 'package:glycefy/screens/homeScreens/prescription_screen.dart';
import 'package:glycefy/screens/homeScreens/profile_screen.dart';
import 'package:glycefy/screens/homeScreens/testglycemie_screen.dart';
import 'package:glycefy/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      appBar: AppBar(
        title: Text("Glycefy"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async => await loginProvider.logout())
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                primary: false,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TestGlucose()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/test-de-diabete.svg',
                            height: 128,
                          ),
                          Text(
                            ' Glucose test ',
                            style: cardTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => medication()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/medicament.svg',
                            height: 128,
                          ),
                          Text(
                            'Medication',
                            style: cardTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => prescription()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/ordonnance.svg',
                            height: 128,
                          ),
                          Text(
                            'Prescription',
                            style: cardTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => profile()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/profile.svg',
                            height: 128,
                          ),
                          Text(
                            'Your profile',
                            style: cardTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
