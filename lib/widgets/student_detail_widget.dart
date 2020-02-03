import 'package:flutter/material.dart';
import 'package:smn_v1/theme.dart';

class StudentDetailWidget extends StatelessWidget {
  final String  studentIdNumber, firstName, lastName, dateOfBirth, studentClass;

  StudentDetailWidget(
    {@required this.studentIdNumber,
    @required this.firstName,
    @required this.lastName,
    @required this.dateOfBirth,
    @required this.studentClass});


  @override 
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,  
      children: <Widget>[
        buildDetailColumn("student Id Number", studentIdNumber),
              SizedBox(height: 2.0),
                      Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
              SizedBox(height: 2.0),
        buildDetailColumn("first Name", firstName),
              SizedBox(height: 2.0),
                      Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
              SizedBox(height: 2.0),
        buildDetailColumn("last Name", lastName),
              SizedBox(height: 2.0),
                      Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
              SizedBox(height: 2.0),
        buildDetailColumn("date Of Birth", dateOfBirth),
              SizedBox(height: 2.0),
                      Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
              SizedBox(height: 2.0),
        buildDetailColumn("Class", studentClass),
                              Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
              SizedBox(height: 2.0),
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
