import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
import '../../widgets/divider_with_text_widget.dart';
import 'finish_view.dart';



class NewStudentClassView extends StatelessWidget {
  final Student student;
  NewStudentClassView({Key key, @required this.student}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    TextEditingController _studentClassController = new TextEditingController();
    _studentClassController = TextEditingController();

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
                  controller: _studentClassController,
                  autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "Add Student Class",),
              ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                // Navigator.push(
                //   context, 
                //   FadePageRoute(widget: NewStudentFinishView(student: student))
                // );
                                    student.studentClass = _studentClassController.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewStudentFinishView(student: student)),
                );
              },
              )
          ] 
        ),
      )
      );
  }
}



// class NewStudentClassView extends StatelessWidget {
//   final Student student;
//   NewStudentClassView({Key key, @required this.student}) : super(key: key);
//   @override 
//   Widget build(BuildContext context) {
//     TextEditingController _textController = new TextEditingController();
//     _textController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Student Class'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//            Text("Enter Student Class"),
//             Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: TextField(
//                   controller: _textController,
//                   autofocus: true,
//                 ),
//               ),
//             RaisedButton(
//               child: Text("Continue"),
//               onPressed: () {
//                 Navigator.push(
//                   context, 
//                   FadePageRoute(widget: NewStudentFinishView(student: student))
//                 );
//               },
//               )
//           ] 
//         ),
//       )
//       );
//   }
// }