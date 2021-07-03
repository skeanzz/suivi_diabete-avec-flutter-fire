import 'package:flutter/material.dart';
import 'package:glycefy/net/firebase.dart';
import 'package:intl/intl.dart';

class prescription extends StatefulWidget {
  const prescription({Key key}) : super(key: key);

  @override
  _prescriptionState createState() => _prescriptionState();
}

class _prescriptionState extends State<prescription> {
  TextEditingController _medicineNameController;
  TextEditingController _medicineInfoController;
  final _formkey = GlobalKey<FormState>();
  DateTime dateStart;
  DateTime dateEnd;


  @override
  void initState() {
    _medicineNameController = TextEditingController();
    _medicineInfoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _medicineInfoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("prescription"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text("Hi ,",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Text(
                      "Enter your medicine name",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _medicineNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Medicine information",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 5,
                      controller: _medicineInfoController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Enter the date of the start of treatment ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () => pickDateStart(context),
                      height: 60,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(getTextDateStart()),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Enter the date of the end of treatment ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () => pickDateEnd(context),
                      height: 60,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(getTextDateEnd()),
                    ),
                    SizedBox(height: 50),
                    MaterialButton(onPressed: () =>  userPrescriptionAdd(_medicineNameController.text,_medicineInfoController.text, dateStart, dateEnd),
                      height: 60,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Submit"),

                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
  Future pickDateStart(BuildContext context) async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateStart ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => dateStart = newDate);
  }
  Future pickDateEnd(BuildContext context) async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateEnd ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null || newDate.isBefore(dateStart)) return;

    setState(() => dateEnd = newDate);
  }
  String getTextDateStart() {
    if (dateStart == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateStart);

    }

  }
  String getTextDateEnd() {
    if (dateEnd == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateEnd);

    }

  }

}

