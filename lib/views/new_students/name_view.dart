import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/views/new_students/class_view.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
import '../../widgets/divider_with_text_widget.dart';
// import 'date_view.dart';


class NewStudentNameView extends StatelessWidget {

  
  final Student student;
  NewStudentNameView({Key key, @required this.student}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
      TextEditingController _firstNameController = new TextEditingController();
        _firstNameController.text = student.firstName;
      TextEditingController _lastNameController = new TextEditingController();
        _lastNameController.text = student.lastName;
    // _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Name'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text("Enter Student First Name"),
             Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: _firstNameController,
              autofocus: true,
            ),
              ),

              SizedBox(height: 20),
            Text("Enter Student Last Name"),
             Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: _lastNameController,
              autofocus: true,
            ),
              ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "Add Student's Last Name",),
              ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                    student.firstName = _firstNameController.text;
                    student.lastName = _lastNameController.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewStudentClassView(student: student)),
                );
              },
              )
          ] 
        ),
      )
      );
  }
}



// class NewStudentNameView extends StatelessWidget {
//   final Student student;
//   NewStudentNameView({Key key, @required this.student}) : super(key: key);
//   @override 
//   Widget build(BuildContext context) {
//       TextEditingController _textController = new TextEditingController();
//     _textController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Student Name'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text("Enter Student First Name"),
//                  Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: TextField(
//                   controller: _textController,
//                   autofocus: true,
//                 ),
//               ),
//                 Text("Enter Student Last Name"),
//                  Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: TextField(
//                   controller: _textController,
//                   autofocus: true,
//                 ),
//               ),
//               ],
//             ),
  
//             RaisedButton(
//               child: Text("Continue"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   FadePageRoute(widget: NewStudentDateView(student: student))
//                 );
//               },
//               )
//           ] 
//         ),
//       )
//       );
//   }
// }