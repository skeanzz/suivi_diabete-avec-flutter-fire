import 'package:flutter/material.dart';
import 'package:glycefy/net/firebase.dart';
import 'package:glycefy/screens/homeScreens/medicationview_screen.dart';
import 'package:intl/intl.dart';

class medication extends StatefulWidget {
  const medication({Key key}) : super(key: key);

  @override
  _medicationState createState() => _medicationState();
}

class _medicationState extends State<medication> {
  TextEditingController _medicineNameController;
  final _formkey = GlobalKey<FormState>();
  DateTime date;
  TimeOfDay time;

  @override
  void initState() {
    _medicineNameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _medicineNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("medication"),
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
                    "Enter the medicine name taken",
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
                    "Enter the date of taking the medication ",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () => pickDate(context),
                    height: 60,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(getTextDate()),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter the time of taking the medication ",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () => pickTime(context),
                    height: 60,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(getTextTime()),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () => userMedicineAdd(
                            _medicineNameController.text, date, time),
                        height: 60,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Submit"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => medicationview())),
                          child: Text("View your medication history"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getTextDate() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  String getTextTime() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
