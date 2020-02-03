import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smn_v1/models/Attendance.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/pages/qrcode_page.dart';
// import 'package:smn_v1/pages/student_detail.dart';
import 'package:smn_v1/theme.dart';
// import 'package:smn_v1/widgets/FadePageRoute.dart';
import 'package:smn_v1/widgets/student_detail_widget.dart';

class StudentCardWidget extends StatelessWidget {
  final Student student;
  // final Attendance attendance;
  final bool showQR;

  StudentCardWidget({@required this.student, this.showQR = true});

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      padding: showQR ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0) : const EdgeInsets.all(0.0),
      child: Material(
        color: primaryColor,
        elevation: showQR ? 8.0 : 0.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(FadePageRoute(widget: QRcodePage(student: student)));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return QRcodePage(student: student);
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[

                

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      StudentDetailWidget(
                        studentIdNumber: student.studentIdNumber,
                        firstName: student.firstName,
                        lastName: student.lastName,
                        dateOfBirth: student.dateOfBirth,
                        studentClass: student.studentClass,
                      ),
                      SizedBox(height: 16.0),
                      Container(
                      height: 0.8,
                      color: Colors.white,
                    ),
                       Container(
                      height: 0.8,
                      color: Colors.white,
                    ),
                    
                    ],
                    ),
                    )
              ],
              )
          )

        ),
      ),
    );
  }
}



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