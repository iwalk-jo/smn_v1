
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smn_v1/bloc.navigation_bloc/navigation_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smn_v1/models/Attendance.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/pages/attendance_page.dart';
import 'package:smn_v1/pages/checkIn_page.dart';
import 'package:smn_v1/pages/checkOut_page.dart';
import 'package:smn_v1/pages/profile_page.dart';
// import 'package:smn_v1/pages/settings_page.dart';
// import 'package:smn_v1/pages/profile_page.dart';
// import 'package:smn_v1/pages/attendance_page.dart';
import 'package:smn_v1/sidebar/menu_item.dart';
import 'package:smn_v1/theme.dart';
import 'package:smn_v1/views/new_students/add_student_view.dart';
// import 'package:smn_v1/sidebar/sidebar_layout.dart';
// import 'package:smn_v1/services/auth_service.dart';
// import 'package:smn_v1/views/new_students/add_student_view.dart';
// import 'package:smn_v1/widgets/loading.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/student_card.dart';
// import 'package:smn_v1/widgets/search_bar.dart';
// import 'package:smn_v1/widgets/menu_item.dart';
// import 'package:smn_v1/widgets/navigation_bloc.dart';
// import 'package:smn_v1/widgets/app_bar.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/student_card.dart';
import 'package:smn_v1/widgets/student_detail_widget.dart';
// import 'package:smn_v1/widgets/toggle_widget.dart';
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

  class Home extends StatefulWidget {
    // final List<Student> studentsList = [
      
    // ];
    //   final List<Student> studentsList = [
    //   Student("0011", "Jane", "Doe", "grade 10",),
    //   Student("0012", "Josh", "Doe", "grade 11",),
    //   Student("0013", "Joe", "Doe", "grade 12",)
    // ];
    
    


  //   Stream<QuerySnapshot> getUsersStudentsStreamSnapshots(BuildContext context) async* {
  //   final uid = await Provider.of(context).auth.getCurrentUID();
  //   yield* Firestore.instance.collection('userData').document(uid).collection('students').snapshots();
  // }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override 
  Widget build(BuildContext context) {
    // Student student = Student();
    // final List<Student> student = [];
    // final student = studentsList[index];

  final newStudent = new Student(null, null, null, null,);
  //   Student student = Student(null, null, null, null, );
  // student.studentID = "100";
  // student.firstName = "JOHN";
  // student.lastName = "Doe";
  // // student.email = "johndoe@gmail.com";
  // // student.phoneNumber = "081234567890";
  // // student.dateOfBirth = "1/02/2018";
  // student.studentClass = "Grade 10";

  // Student student = Student(null, null, null, null,);
  // student.studentID = "100";
  // student.firstName = "JOHN";
  // student.lastName = "Doe";
  // // student.email = "johndoe@gmail.com";
  // // student.phoneNumber = "081234567890";
  // // student.dateOfBirth = "1/02/2018";
  // student.studentClass = "Grade 10";
  
    // Attendance attendance = Attendance();
    // attendance.checkin = "1/02/2018 8:50am";
    // attendance.absent = "5";
    // attendance.checkout = "1/02/2018 3:50pm";
// bool loading = false;

// return loading ? Loading() : Scaffold(
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
        title: Text("SMN QR APP "),   
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => AddNewStudentView(student: newStudent,)),
          //     );
          //     // loading = false;
          //   },
          // ),
          
          // IconButton(
          //   icon: Icon(Icons.undo),
          //   onPressed: () async {
          //     try {
          //       AuthService auth = Provider.of(context).auth;
          //       await auth.signOut();
          //       print("Signed Out!");
          //     } catch (e) {
          //       print (e);
          //     }
          //   },
          // ),
          
        ],
      ),
      // Drawer(child: SideBarLayout()),
      // drawer: SideBarLayout(),


      floatingActionButton: FloatingActionButton(
            // icon: Icon(Icons.add), 
            backgroundColor: primaryColor,       
            child: Icon(Icons.add),        
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewStudentView(student: newStudent,)),
              );
              // loading = false;
              
            },          
          ),

       drawer: Drawer(
             child: Stack(
              children: <Widget>[
                    Row(
                     children: <Widget>[ 
                       Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: primaryColor,
                          child: SafeArea(
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                // SizedBox(
                                //   height: 100,
                                // ),
                                // UserAccountsDrawerHeader(
                                //   accountName: Text(
                                //     "Tom",
                                //    //  "${user.displayName ?? 'Anonymous'}",
                                //     style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                                //  ),
                                //  accountEmail: Text(
                                //    'tom@email.com',
                                //    // "${user.email ?? 'Anonymous'}",
                                //    style: TextStyle(color: Color(0xFF1BB5FD), fontSize: 20,),
                                //  ),
                                //  currentAccountPicture: CircleAvatar(
                                //    backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.deepPurple : Colors.white,
                                //    child: Icon(
                                //      Icons.perm_identity,
                                //      color: Colors.white,
                                //    ),
                                //    radius: 40,
                                //  ),
                                //  otherAccountsPictures: <Widget>[
                                //    CircleAvatar(
                                //    backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.deepPurple : Colors.white,
                                //    child: Text("A")
                                //    ),
                                //  ],
                                // ),
                                // Row(
                                //   children: <Widget>[
                                //     IconButton(icon: Icon(Icons.search),
                                //       onPressed: (){
                                //     showSearch(context: context, delegate: SearchBar());
                                //       }),
                                //     ListTile(
                                //   // title: Text("Close"),
                                //   trailing: Icon(Icons.close),
                                //   onTap: () => Navigator.of(context).pop(),
                                // ),
                                //   ],
                                    
                                // ),

                              ListTile(
                                  // title: Text("Close"),
                                  trailing: Icon(Icons.close),
                                  onTap: () => Navigator.of(context).pop(),
                                ),
                                

                                Divider(
                                  height: 64,
                                  thickness: 0.5,
                                  color: Colors.white.withOpacity(0.3),
                                  indent: 32,
                                  endIndent: 32,
                                ),
                                MenuItem(
                                  icon: Icons.home,
                                  title: "Dashboard",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Navigator.of(context).pushReplacementNamed('/home');
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Home()));
                                   //  onIconPressed();
                                   //  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                                  },
                                ),

                                 MenuItem(
                                 icon: Icons.person,
                                  title: "User Profile",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilePage()));
                                    // Navigator.of(context).pushReplacementNamed('/profilePage');
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
                                   //  onIconPressed();
                                   //  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                                  },
                                ),

                                 ListTile(
                                   leading: Icon(Icons.calendar_today, color: Colors.black,),
                                  // title: "Attendance",
                                  title: AutoSizeText('Check In/Out Records', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white),),
                                  // title: AutoSizeText('Check In/Out Records'),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AttendancePage()));
                                    // Navigator.of(context).pushReplacementNamed('/attendancePage');
                                   //  onIconPressed();
                                   //  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                                  },
                                ),

                                MenuItem(
                                icon: Icons.settings,
                                  title: "Settings",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilePage()));
                                   //  onIconPressed();
                                   //  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                                  },
                                ),

                                  Divider(
                                  height: 64,
                                  thickness: 0.5,
                                  color: Colors.white.withOpacity(0.3),
                                  indent: 32,
                                  endIndent: 32,
                                ),
                              SizedBox(
                                  height: 150,
                                ),
                                MenuItem(                                    
                                  icon: Icons.exit_to_app,
                                  title: "Logout",
                                  onTap: () async{
                                   //  onIconPressed(); 
                                    {
                                       try { 
                                         await Provider.of(context).auth.signOut();
                                         print("Signed Out!");
                                       } catch (e) {
                                         print(e);
                                       }
                                     }
                                  }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                     ]
                    ),
                  ],
             ),
        ),

    body: Container(
      // scrollDirection: Axis.vertical,
      child: StreamBuilder(
        stream: getUserStudentsStreamSnapshots(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text("Loading...");
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            // itemBuilder: (BuildContext context, int index) => StudentCardWidget(student: student));
            itemBuilder: (BuildContext context, int index) => buildStudentCard(context, snapshot.data.documents[index]));
        }
      )
      // child: Column(
      //   children: <Widget>[
      //     SizedBox(height: 20.0),
      //     ListView(
      //       scrollDirection: Axis.vertical,
      //       shrinkWrap: true,
      //       children: <Widget>[
      //         Hero(tag: student.studentID, child: StudentCardWidget(student: student)),
      //       ],
      //     ),
      //   ],
      //   ),
      ),
    );
  }

    Stream<QuerySnapshot> getUserStudentsStreamSnapshots(BuildContext context) async* {
      final uid = await Provider.of(context).auth.getCurrentUID();
      yield* Firestore.instance.collection('userData').document(uid).collection('students').snapshots();
    }

  Widget buildStudentCard(BuildContext context, DocumentSnapshot student) {

  // final student = studentsList[index];

 return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Material(
        color: Colors.white,
        elevation: 8.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
                  child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          StudentDetailWidget(
                            studentID: student['studentID'],
                            firstName: student['firstName'],
                            lastName: student['lastName'],
                            // dateOfBirth: student.dateOfBirth,
                            studentClass: student['studentClass'],
                          ),
                          SizedBox(height: 5.0),
                          Container(
                          height: 0.8,
                          color: primaryColor,
                        ),
                        SizedBox(height: 5.0),
                        ],
                        ),
                        ),
                  ],    
                  ),

              Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
               
                  RaisedButton(
                    // shape:
                    //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.tealAccent[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Check-In", style: buttonTextStyle),
                      
                    ),
                    onPressed: () {
                     
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return CheckInPage(student:  Student.fromSnapshot(student));
                        }));
                    },
                  ),

                  Spacer(),

                    RaisedButton(
                      // shape:
                      //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.red[200],
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Check-Out", style: buttonTextStyle),
                  ),
                  onPressed: () {
                    
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          // return  CheckOutPage(student: student);
                          return CheckOutPage(student:  Student.fromSnapshot(student));
                          
                        }));
                  },
                    )
                ],
                ),
            )
              ],
            ),
            
          ),
        ),

        
        
      ),
      
    );
}

    // IconButton(icon: Icon(Icons.settings, color: Colors.white, size: 30,),
    //             onPressed: () {
    //               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //                       return StudentSettings(student:  Student.fromSnapshot(student));
    //                     }));
    //             },
    //             ),
  
}

