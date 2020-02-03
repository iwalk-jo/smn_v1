import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/widgets/FadePageRoute.dart';
import 'date_view.dart';

class NewStudentNameView extends StatelessWidget {
  final Student student;
  NewStudentNameView({Key key, @required this.student}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
      TextEditingController _textController = new TextEditingController();
    _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Enter Student First Name"),
                 Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                ),
              ),
                Text("Enter Student Last Name"),
                 Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                ),
              ),
              ],
            ),
  
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.push(
                  context,
                  FadePageRoute(widget: NewStudentDateView(student: student))
                );
              },
              )
          ] 
        ),
      )
      );
  }
}