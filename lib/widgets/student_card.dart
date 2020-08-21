import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smn_v1/models/Attendance.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/pages/checkIn_page.dart';
import 'package:smn_v1/pages/checkOut_page.dart';
// import 'package:smn_v1/pages/student_detail.dart';
import 'package:smn_v1/theme.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
import 'package:smn_v1/widgets/student_detail_widget.dart';
// import 'package:smn_v1/widgets/toggle_widget.dart';

class StudentCardWidget extends StatelessWidget {
  final Student student;
//  final Student = studentsList[index];
  
  // final Attendance attendance;
  // final bool showQR;

  StudentCardWidget({@required this.student});

  @override 
  Widget build(BuildContext context,) {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Material(
        color: Colors.white,
        elevation: 8.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                          studentID: student.studentID,
                          firstName: student.firstName,
                          lastName: student.lastName,
                          // dateOfBirth: student.dateOfBirth,
                          studentClass: student.studentClass,
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
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        return CheckInPage(student: student);
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
                        return  CheckOutPage(student: student);

                        
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
      
    );
  }
}



          // onTap: () {
          //   // Navigator.of(context).push(FadePageRoute(widget: QRcodePage(student: student)));
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //     return QRcodePage(student: student);
          //   }));
          // },


          

// class AttendanceDetailWidget extends StatelessWidget {
//   final String checkin, absent, checkout;

//   AttendanceDetailWidget(
//     {@required this.checkin, 
//     @required this.absent, 
//     @required this.checkout});

//   @override 
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         buildDetailColumn("checkin", checkin),
//         Spacer(),
//         buildDetailColumn("absent", absent),
//         Spacer(),
//         buildDetailColumn("checkout", checkout),
//       ],
//       );
//   }


// Widget buildDetailColumn(String label, String value) => Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisSize: MainAxisSize.max,
//   children: <Widget>[
//     Text(label.toUpperCase(), style: smallTextStyle),
//     Text(value, style: smallBoldTextStyle),
//   ],
// );

// }