import 'package:flutter/material.dart';
import 'package:glycefy/services/auth_services.dart';
import 'package:provider/provider.dart';

class resetPass extends StatefulWidget {
  final Function toggleScreen;

  const resetPass({Key key, this.toggleScreen}) : super(key: key);

  @override
  _resetPassState createState() => _resetPassState();
}

class _resetPassState extends State<resetPass> {
  TextEditingController _emailResetController;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailResetController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailResetController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {}),
                  SizedBox(height: 30),
                  Text("Welcome",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20),
                  Text(
                    "Type your Email here",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailResetController,
                    validator: (val) =>
                    val.isNotEmpty ? null : "Please enter a email address ",
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),

                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        print("Email: ${_emailResetController.text}");
                        await loginProvider.reset(_emailResetController.text.trim());
                        Navigator.of(context).pop();
                      }
                    },
                    height: 60,
                    minWidth: loginProvider.isLoading ? null : double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: loginProvider.isLoading
                        ? CircularProgressIndicator()
                        : Text(
                      "Send Request",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
