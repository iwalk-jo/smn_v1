import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
// import 'package:smn_v1/models/Attendance.dart';
// import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/widgets/app_bar.dart';
import 'package:smn_v1/widgets/divider_with_text_widget.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/widgets/provider_widget.dart';
// import 'package:smn_v1/bloc.navigation_bloc/navigation_bloc.dart';

// with NavigationStates 

class AttendancePage extends StatelessWidget {

// final Attendance attendance;

// final db = Firestore.instance;

// final Attendance attendance;
// AttendancePage({Key key, @required this.attendance}) : super(key: key);
// // //  final Student = studentsList[index];
  
// //   // final Attendance attendance;
// //   // final bool showQR;

//   AttendancePage({@required this.attendance});

  // final List<Attendance> attendanceList =[
  //   Attendance("001", DateTime.now(), DateTime.now()),
  //   Attendance("002", DateTime.now(), DateTime.now()),
  //   Attendance("003", DateTime.now(), DateTime.now()),
  //   Attendance("004", DateTime.now(), DateTime.now()),
  // ];

  @override 
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: CustomAppBar(
        title: 'Attendance Record'
      ),
          body: Container(
            // scrollDirection: Axis.vertical,
            child: Column( 
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: TextField( 
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                      contentPadding:
                      const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
                    ) 
                ),
                 ),
              SizedBox(height: 20,),
                Padding(
                  // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: const EdgeInsets.all(20.0),
                  child: Divider(),
                ),
                SizedBox(height: 50,),
                        Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DividerWithText(dividerText: "CheckIn & CheckOut Dates",),
              ),
                Expanded(
                  flex: 12, 
                  child: Container(
                     // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    margin: EdgeInsets.only(left:30, right:30, top:50, bottom: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 251, 252),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.45), blurRadius: 30, offset: Offset(0, 10))]
                    ),
                    child: Center( 
                      child: StreamBuilder(
                        stream: getUsersStudentAttendanceStreamSnapshots(context),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) return const Text("Loading Attendance record!!!");
                          return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (BuildContext context, int index) => buildAttendanceCard(context, snapshot.data.documents[index]));
                        }
                      ),
                    ),
                  ),
                ),
              ],
               )
        // child: Text(
        //   "Attendance Record",
        //   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        // ),
        
      ),
      
    );

    
  }

    Stream<QuerySnapshot> getUsersStudentAttendanceStreamSnapshots(BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance.collection('userData').document(uid).collection('students').document('student').collection('attendance').snapshots();
  }


  Widget buildAttendanceCard(BuildContext context, DocumentSnapshot attendance) {
    // final user = snapshot.data;

  // final attendance = attendanceList[index];

  return Container(
    child: Card(
      child: Column(  
      children: <Widget>[  
          Row(  
            children: <Widget>[  
            Text(attendance['attendanceID'], style: TextStyle(fontSize: 20.0),),  
            ]  
                ),  
          Row(
          children: <Widget>[  
            Text("${DateFormat('dd/MM/yyyy').format(attendance['checkIn']).toString()} - ${DateFormat('dd/MM/yyyy').format(attendance['checkOut']).toString()}"),
  
            // Text(DateFormat('dd/MM/yyyy').format(attendance.checkIn).toString()),
  
            // Text(DateFormat('dd/MM/yyyy').format(attendance.checkOut).toString()),
  
            // Text(index.toString()),
  
            // Text(attendanceList[index].studentID),

            
            //  FutureBuilder(
            //         future: Provider.of(context).auth.getCurrentUser(),
            //         builder: (context, snapshot) {
            //           if ( snapshot.connectionState == ConnectionState.done) {
            //             return displayUserInformation(context, snapshot);
            //           } else {
            //             return CircularProgressIndicator();
            //           }
            //         }
            //       )
  
        ],
  
        ),
  
      ],
  
        ),
    )
  );
}


// Attendance Modal
// void _studentAttendanceBottomSheet(context) {
//   showModalBottomSheet(context: context, builder: (BuildContext bc) {
//     return Container(
//       height: MediaQuery.of(context).size.height * .60,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//            children: <Widget>[
//           Row(
//             children: <Widget>[
//               Text("CheckIn/CheckOut Records"),
//               Spacer(),
//               IconButton(
//                 icon: Icon(Icons.cancel, color: Colors.orange, size: 25,),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 }
//                 ),
//             ],
//             ),
//             Row(
//               children: <Widget>[
//                 Text(
//                   students.studentID,
//                   style: TextStyle(fontSize: 30, color: Colors.green[900]),
//                 )
//               ],)
//         ]
//         )
//        )
//     );
//   });
// }

}

