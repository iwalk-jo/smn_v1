import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/widgets/FadePageRoute.dart';
import 'finish_view.dart';

class NewStudentClassView extends StatelessWidget {
  final Student student;
  NewStudentClassView({Key key, @required this.student}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    TextEditingController _textController = new TextEditingController();
    _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Class'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text("Enter Student Class"),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                ),
              ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.push(
                  context, 
                  FadePageRoute(widget: NewStudentFinishView(student: student))
                );
              },
              )
          ] 
        ),
      )
      );
  }
}