import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smn_v1/models/Student.dart';
// import 'package:smn_v1/widgets/loading.dart';
// import 'package:smn_v1/pages/home_page.dart';
import 'package:smn_v1/widgets/provider_widget.dart';

import '../../widgets/divider_with_text_widget.dart';


class NewStudentFinishView extends StatefulWidget {
  final Student student;
  NewStudentFinishView({Key key, @required this.student}) : super(key: key);

  @override
  _NewStudentFinishViewState createState() => _NewStudentFinishViewState();
}

class _NewStudentFinishViewState extends State<NewStudentFinishView> {
  final db = Firestore.instance;

  @override 
  Widget build(BuildContext context) {
    // final studentParent = student.parent();
    // var studentKeys = studentParent.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Student Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text("New Student Details"),
            SizedBox(height: 20),
        Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "Confirm Details ",),
              ),
               SizedBox(height: 20),
           Text("Student Id Number ${widget.student.studentID}"),
            SizedBox(height: 20),
           Text("Student First Name ${widget.student.firstName}"),
            SizedBox(height: 20),
           Text("Student Last Name ${widget.student.lastName}"),
          //   SizedBox(height: 20),
          //  Text("Student Date Of Birth ${student.dateOfBirth}"),
            SizedBox(height: 20),
           Text("Student Class ${widget.student.studentClass}"),
            SizedBox(height: 20),

        Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "Save Student's Data",),
              ),
  
            RaisedButton(
              child: Text("Finish"),
              onPressed: () async {

                // save data to firebase
                final uid = await Provider.of(context).auth.getCurrentUID();
                await db.collection("userData").document(uid).collection("students").add(widget.student.toJson());
                // await db.collection("students").document(uid).collection("students").add(student.toJson());
                // Navigator.of(context).popUntil((route) => route.isFirst);
                // Navigator.of(context).pop();
                //  Navigator.of(context).pushReplacementNamed('/home');
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              },
              )
          ] 
        ),
      )
      );
  }
}


// class NewStudentFinishView extends StatelessWidget {
//   final db = Firestore.instance;

//   final Student student;
//   NewStudentFinishView({Key key, @required this.student}) : super(key: key);

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Student Card'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//            Text("Finish"),
//            Text("Student Id Number ${student.studentIdNumber}"),
//            Text("Student First Name ${student.firstName}"),
//            Text("Student Last Name ${student.lastName}"),
//            Text("Student Date Of Birth ${student.dateOfBirth}"),
//            Text("Student Class ${student.studentClass}"),
  
//             RaisedButton(
//               child: Text("Finish"),
//               onPressed: () async {
//                 final uid = await Provider.of(context).auth.getCurrentUID();
                
//                 await db.collection("userData").document(uid).collection("students").add(student.toJson());
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               )
//           ] 
//         ),
//       )
//       );
//   }
// }