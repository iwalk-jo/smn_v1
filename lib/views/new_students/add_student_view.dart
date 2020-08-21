import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
import '../../widgets/divider_with_text_widget.dart';
import 'name_view.dart';


class AddNewStudentView extends StatelessWidget {
  final Student student;
  AddNewStudentView({Key key, @required this.student}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = student.studentID;

    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Student'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter Student ID Number"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle)
                  ),
                  autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "Add Student ID Number",),
              ),
              RaisedButton(
                child: Text("Continue"),
                onPressed: () {
                  // student.studentIdNumber = _titleController.text;
                  // Navigator.push(context, 
                  // FadePageRoute(widget: NewStudentNameView(student: student))
                  // );
                   student.studentID = _titleController.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewStudentNameView(student: student)),
                );
                },
                )
            ],
             
          ),
        )
        );
    }
  }





// class AddNewStudentView extends StatelessWidget {
//   final Student student;
//   AddNewStudentView({Key key, @required this.student}) : super(key: key);
//   @override 
//   Widget build(BuildContext context) {
//     TextEditingController _titleController = new TextEditingController();
//     _titleController.text = student.studentIdNumber;

    

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add New Student'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Enter Student ID Number"),
//               Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: TextField(
//                   controller: _titleController,
//                   autofocus: true,
//                 ),
//               ),
//               RaisedButton(
//                 child: Text("Continue"),
//                 onPressed: () {
//                   student.studentIdNumber = _titleController.text;
//                   Navigator.push(context, 
//                   FadePageRoute(widget: NewStudentNameView(student: student))
//                   );
//                 },
//                 )
//             ] 
//           ),
//         )
//         );
//     }

//   }

