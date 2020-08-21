// import 'package:flutter/material.dart';
// // import 'dart:async';
// // import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:smn_v1/models/Student.dart';
// // import 'package:smn_v1/widgets/FadePageRoute.dart';
// import '../../widgets/divider_with_text_widget.dart';
// import 'class_view.dart';


// class NewStudentDateView extends StatefulWidget {

//   final Student student;

//   NewStudentDateView({Key key, @required this.student}) : super(key: key);

//   @override
//   _NewStudentDateViewState createState() => _NewStudentDateViewState();
// }

// class _NewStudentDateViewState extends State<NewStudentDateView> {
//   DateTime _dateOfBirth = DateTime.now();
  
//   @override 
//   Widget build(BuildContext context) {

//     // TextEditingController _dateOfBirthController = new TextEditingController();
//     //     _dateOfBirthController.text = student.dateOfBirth.toString();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Student Date Of Birth'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("Enter Student Date of Birth: ${DateFormat('MM/dd/yyyy').format(_dateOfBirth).toString()}"),
//             RaisedButton(
//               child: Text("Select Date"),
              
//               onPressed: () async {
                
//                 await showDatePicker(context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(DateTime.now().year - 50),
//                     lastDate: DateTime(DateTime.now().year + 50),
//                     ).then((date) {
//                       setState(() {
//                         _dateOfBirth = date;
//                       });
//                     });
//               },
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                 child: DividerWithText(dividerText: "Add Student Date Of Birth",),
//               ),
            
//             RaisedButton(
//               child: Text("Continue"),
//               onPressed: () {
//                 // widget.student.dateOfBirth = _dateOfBirth.toString();
//                 //       // student.dateOfBirth = _dateOfBirthController.toString;
//                 //   Navigator.push(context, MaterialPageRoute(builder: (context) => NewStudentClassView(student: student)),
//                 // );
//               widget.student.dateOfBirth = _dateOfBirth.toString();
//                 Navigator.push(
//                   context, 
//                   MaterialPageRoute(builder: (context) => NewStudentClassView(student: widget.student)),
//                 );
//               },
//               )
//           ] 
//         ),
//       )
//       );
//   }
  
// }


// // class NewStudentDateView extends StatefulWidget {
// //   final Student student;
// //   NewStudentDateView({Key key, @required this.student}) : super(key: key);

// //   @override
// //   _NewStudentDateViewState createState() => _NewStudentDateViewState();
// // }

// // class _NewStudentDateViewState extends State<NewStudentDateView> {
// //   DateTime _dateOfBirth = DateTime.now();

// //   // Future displayDatePicker(BuildContext context) async {

// //   //   await showDatePicker(context: context,
// //   //   initialDate: DateTime.now(),
// //   //   firstDate: DateTime(2001),
// //   //   lastDate: DateTime(2222)
// //   //   ).then((date) {
// //   //     setState(() {
// //   //       _dateOfBirth = date;
// //   //     });
// //   //   });
    
  
// //   @override 
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Add Student Date Of Birth'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text("Enter Student Date of Birth: ${DateFormat('MM/dd/yyyy').format(_dateOfBirth).toString()}"),
// //             RaisedButton(
// //               child: Text("Select Date"),
// //               onPressed: () async {
// //                 await showDatePicker(context: context,
// //                     initialDate: DateTime.now(),
// //                     firstDate: DateTime(2001),
// //                     lastDate: DateTime(2222)
// //                     ).then((date) {
// //                       setState(() {
// //                         _dateOfBirth = date;
// //                       });
// //                     });
// //               },
// //             ),
            
// //             RaisedButton(
// //               child: Text("Continue"),
// //               onPressed: () {
// //                 widget.student.dateOfBirth = _dateOfBirth.toString();
// //                 Navigator.push(
// //                   context, 
// //                   FadePageRoute(widget: NewStudentClassView(student: widget.student))
// //                 );
// //               },
// //               )
// //           ] 
// //         ),
// //       )
// //       );
// //   }
  
// // }