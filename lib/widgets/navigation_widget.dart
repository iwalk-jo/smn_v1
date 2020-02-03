import 'package:flutter/material.dart';
// import 'package:smn_v1/models/Student.dart';
// import 'package:smn_v1/views/new_students/add_student_view.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
// import 'package:smn_v1/pages.dart';
// import 'package:smn_v1/views/home_view.dart';
// import 'package:smn_v1/views/new_students/add_student_view.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
import 'package:smn_v1/services/auth_service.dart';
import 'package:smn_v1/pages/Student_page.dart';
import 'package:smn_v1/pages/Parent_page.dart';

class NavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationWidgetState();
  }
}


class _NavigationWidgetState extends State<NavigationWidget> {

  
  int _currentIndex = 0;
  final List<Widget> _children = [
    // Home(),
    ParentPage(),
    StudentPage(),
  ];

   @override
  Widget build(BuildContext context) {
  //  final newStudent = new Student(null, null, null, null, null, null, null,);
    return Scaffold(
      appBar: AppBar(
        title: Text("SMN Navigation"),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(
          //       context, 
          //       FadePageRoute(widget: AddNewStudentView(student: newStudent))
          //       );
          //   },
          // ),
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
          )  
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.explore),
              title: new Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              title: new Text("Past Activities"),
            ),
          ]),
    );
  }

  onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


