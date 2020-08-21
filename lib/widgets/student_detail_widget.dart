// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smn_v1/theme.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';

class StudentDetailWidget extends StatelessWidget {
  final String  studentID, firstName, lastName, studentClass;

  

  StudentDetailWidget(
    {@required this.studentID,
    @required this.firstName,
    @required this.lastName,
    @required this.studentClass});



  // Stream<QuerySnapshot> getUserStudentsStreamSnapshots(BuildContext context) async* {
  //     final uid = await Provider.of(context).auth.getCurrentUID();
  //     yield* Firestore.instance.collection('userData').document(uid).collection('students').snapshots();
  //   }
  @override 
  Widget build(BuildContext context) {

    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,  
      children: <Widget>[
        buildDetailColumn("student ID : ", studentID),
              SizedBox(height: 10.0),
        buildDetailColumn("first Name : ", firstName),

              SizedBox(height: 2.0),
        buildDetailColumn("last Name : ", lastName),
              SizedBox(height: 10.0),
    
        buildDetailColumn("Class :", studentClass),
              SizedBox(height: 5.0),
      ],
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

 

}
