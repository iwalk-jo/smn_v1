import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/widgets/provider_widget.dart';



class NewStudentFinishView extends StatelessWidget {
  final db = Firestore.instance;

  final Student student;
  NewStudentFinishView({Key key, @required this.student}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Student Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text("Finish"),
           Text("Student Id Number ${student.studentIdNumber}"),
           Text("Student First Name ${student.firstName}"),
           Text("Student Last Name ${student.lastName}"),
           Text("Student Date Of Birth ${student.dateOfBirth}"),
           Text("Student Class ${student.studentClass}"),
  
            RaisedButton(
              child: Text("Finish"),
              onPressed: () async {
                final uid = await Provider.of(context).auth.getCurrentUID();
                
                await db.collection("userData").document(uid).collection("students").add(student.toJson());
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              )
          ] 
        ),
      )
      );
  }
}