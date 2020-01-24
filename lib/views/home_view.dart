import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';
import 'package:smn_v1/student.dart';

class HomeView extends StatelessWidget {
  final List<Student> studentList = [
    Student("Child Name One", "John", "Doe", "johndoe@gmail.com",
        "081310962001", DateTime.now(), "class One"),
    Student("Child Name Two", "Jane", "Doe", "janedoe@gmail.com",
        "081310962002", DateTime.now(), "class Two"),
    Student("Child Name Three", "Tom", "Doe", "tomdoe@gmail.com",
        "081310962003", DateTime.now(), "class Three"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildStudentCard(context, index)
              ),
    );
  }

  Widget buildStudentCard(BuildContext context, int index) {
    final student = studentList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      student.title,
                      style: new TextStyle(fontSize: 30.0),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      student.firstName,
                      style: new TextStyle(fontSize: 10.0),
                    ),
                    Spacer(),
                    Text(
                      student.lastName,
                      style: new TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(student.dateOfBirth).toString()}"),
                    Spacer(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(student.email.toString()),
                    Spacer(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(student.phoneNumber.toString()),
                    Spacer(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(student.studentClass.toString()),
                    Spacer(),
                  ],
                ),
              )

              // Text("${DateFormat('dd/MM/yyyy').format(student.dateOfBirth).toString()} - ${DateFormat('dd/MM/yyyy').format(student.dateOfBirth).toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
