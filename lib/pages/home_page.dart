
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smn_v1/models/Attendance.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/services/auth_service.dart';
import 'package:smn_v1/views/new_students/add_student_view.dart';
// import 'package:smn_v1/widgets/app_bar.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';
import 'package:smn_v1/widgets/student_card.dart';
import 'package:smn_v1/widgets/toggle_widget.dart';
// import 'package:smn_v1/views/new_students/add_student_view.dart';

// class StudentListPage extends StatefulWidget {
  
  //  final Student student;

  // StudentListPage({@required this.student});

//   @override
//   StudentListPageState createState() {
//     return new StudentListPageState();
//   }
// }
// class StudentListPageState extends State<StudentListPage> {

  class HomePage extends StatelessWidget {
    // final List<Student> studentList = [];
    

    


  //   Stream<QuerySnapshot> getUsersStudentsStreamSnapshots(BuildContext context) async* {
  //   final uid = await Provider.of(context).auth.getCurrentUID();
  //   yield* Firestore.instance.collection('userData').document(uid).collection('students').snapshots();
  // }
  @override 
  Widget build(BuildContext context) {
    // Student student = Student();
    // final List<Student> student = [];
    Student student = Student(null, null, null, null, null, null, null,);
  student.studentIdNumber = "100";
  student.firstName = "JOHN";
  student.lastName = "Doe";
  student.email = "johndoe@gmail.com";
  student.phoneNumber = "081234567890";
  student.dateOfBirth = "1/02/2018";
  student.studentClass = "Grade 10";
  
    // Attendance attendance = Attendance();
    // attendance.checkin = "1/02/2018 8:50am";
    // attendance.absent = "5";
    // attendance.checkout = "1/02/2018 3:50pm";


    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
        title: Text("SMN QR APP "),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewStudentView(student: student,)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
            },
          ),
          
        ],
      ),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[

          SizedBox(height: 20.0),
          // RadioButton
          ToggleWidget(firstOption: "Checked In", secondOption: "Checked Out"),

          SizedBox(height: 20.0),

          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Hero(tag: student.studentIdNumber, child: StudentCardWidget(student: student)),
            ],
          ),
        ],
        ),
      ),
    );
  }
}