// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/theme.dart';
import 'package:smn_v1/widgets/custom_text_field.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';

class StudentSettings extends StatefulWidget {
  // final String  studentID, firstName, lastName, studentClass;
  final Student student;


StudentSettings({Key key, @required this.student}) : super(key: key);
  // StudentDetailWidget(
  //   {@required this.studentID,
  //   @required this.firstName,
  //   @required this.lastName,
  //   @required this.studentClass});



  // Stream<QuerySnapshot> getUserStudentsStreamSnapshots(BuildContext context) async* {
  //     final uid = await Provider.of(context).auth.getCurrentUID();
  //     yield* Firestore.instance.collection('userData').document(uid).collection('students').snapshots();
  //   }

  @override
  _StudentSettingsState createState() => _StudentSettingsState();

}

class _StudentSettingsState extends State<StudentSettings> {

  TextEditingController _settingsController = TextEditingController();
  //  var _settings;
  

  TextEditingController _studentIDController = new TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _studentClassController = TextEditingController();

  void initState() {
    super.initState();
    _settingsController.text = widget.student.studentID.toString();
    // _settings = widget.student.documentId.toString();
  }

// List<Widget> setStudentFields(_settingsController) {
//   List<Widget> fields = [];

//   fields.add(CustomTextField(controller: _studentIDController, helperText: "Student Id Editor"));
//   fields.add(CustomTextField(controller: _firstNameController, helperText: "Student First Name Editor"));
//   fields.add(CustomTextField(controller: _lastNameController, helperText: "Student Last Name Editor"));
//   fields.add(CustomTextField(controller: _studentClassController, helperText: "Student Class/grade Editor"));

// }
  

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start, 
      mainAxisAlignment: MainAxisAlignment.center, 
            // children: setStudentFields(_settingsController),        
        children: <Widget>[ 


              // Column(children: setStudentFields(_settingsController),),


                  Row(children: <Widget>[
                    Expanded(child: CustomTextField(controller: _studentIDController, helperText: "Student ID"),)
                  ],),

                    Row(children: <Widget>[
                    Expanded(child: CustomTextField(controller: _firstNameController, helperText: "Student's First Name"),)
                  ],),

                    Row(children: <Widget>[
                    Expanded(child: CustomTextField(controller: _lastNameController, helperText: "Student's Last Name"),)
                  ],),

                    Row(children: <Widget>[
                    Expanded(child: CustomTextField(controller: _studentClassController, helperText: "Student's Class/Grade"),)
                  ],),  


                // buildDetailColumn("student ID : ", studentID),
                //       SizedBox(height: 10.0),
                // buildDetailColumn("first Name : ", firstName),

                //       SizedBox(height: 2.0),
                // buildDetailColumn("last Name : ", lastName),
                //       SizedBox(height: 10.0),
      
                // buildDetailColumn("Class :", studentClass),
           
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Submit'),
                          color: Colors.tealAccent,
                          textColor: Colors.white,
                          onPressed: () async {
                            widget.student.studentID = _settingsController.text;
                            // setState(() {
                            //   _settings = widget.student.documentId;
                            // });
                            await updateStudent(context);
                            Navigator.of(context).pop();
                          },)
                    ],),

                       Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Delete'),
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          onPressed: () async {
                            await deleteStudent(context);
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                          },)
                    ],)
        ],

        ),
            ),
          ),
    );
  }

  Widget buildDetailColumn(String label, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Text(label.toUpperCase(), style: smallTextStyle),
      Text(value.toUpperCase(), style: smallBoldTextStyle),
    ],
  );


  Future updateStudent(context) async {
    var uid = await Provider.of(context).auth.getCurrentUID();
    final doc = Firestore.instance.collection('userData').document(uid).collection("students").document(widget.student.studentID);

    return await doc.setData(widget.student.toJson());
  }

   Future deleteStudent(context) async {
    var uid = await Provider.of(context).auth.getCurrentUID();
    final doc = Firestore.instance.collection('userData').document(uid).collection("students").document(widget.student.studentID);

    return await doc.delete();
  }
}
