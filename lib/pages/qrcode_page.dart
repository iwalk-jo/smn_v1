// import 'dart:async';

// import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smn_v1/widgets/app_bar.dart';
import 'package:smn_v1/widgets/toggle_widget.dart';
// import 'package:smn_v1/widgets/student_card.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QRcodePage extends StatefulWidget {
  // QRcodePage({Key key}) : super(key: key);

  final Student student;

  @override
  QRcodePage({@required this.student});


  QRcodePageState createState() => QRcodePageState();
}

class QRcodePageState extends State<QRcodePage> {
      bool showCorner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(
        title: 'Attendance'
        // leading: Icon(Icons.chevron_left),
        // backgroundColor: primaryColor,
        // elevation: 0.0,
        // title: Text(
        //   'Attendance', style: TextStyle(fontSize: 28),
        // ),
      ),
      body:Column(
        children: <Widget>[
           SizedBox(height: 10.0),
          // RadioButton
          ToggleWidget(firstOption: "Not Used", secondOption: "Already Used"),

          Expanded(
            flex: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
                child: Container(
                margin: EdgeInsets.only(left:30, right:30, top:50, bottom: 0),

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 251, 252),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.45), blurRadius: 30, offset: Offset(0, 10))]
                ),
                child: Column(
                  // Centered Box
                  children: <Widget>[


                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.more_horiz, size: 40, color: Colors.grey.shade400)),
                              ),),

                        Expanded(
                            flex: 4,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, bottom: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("123**456",
                                          style: TextStyle(
                                            fontSize:28,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w700),

                                          ),

                                      // Hero(
                                      //   tag: widget.student.studentIdNumber,
                                      // child: StudentCardWidget(
                                      //   student: widget.student,
                                      //   showQR: false,
                                      // ),
                                      // ),

                                          // Text("Scan the QRcode", style: TextStyle(
                                          //   fontSize: 14, color: Colors.grey
                                          // )),
                                        ],
                                      ),
                                    )
                                  ),
                                ],
                              ),)
                          ],)
                      ),),




                    Expanded(
                      flex: 7,
                      child: Column(
                        children: <Widget>[
                        // getCorners(),
                          Hero(
                            tag: "qrcode",
                              child:
                              QrImage(
                              data: "1234567890",
                              version: QrVersions.auto,
                              size: 280.0,
                              foregroundColor: Color.fromARGB(255, 80, 93, 124)
                            ),
                          ),
                        ],
                      ),
                      ),

                ],)
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.tealAccent[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Check-In", style: buttonTextStyle),
                  ),
                  onPressed: () {},
                ),
                  RaisedButton(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.red[200],
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Check-Out", style: buttonTextStyle),
                ),
                onPressed: () {},
                  )
              ],),
          )

        ],
      ),
    );
  }

// Widget getCorners() {
//     return AnimatedPositioned(
//       duration: Duration(milliseconds: 300),
//       left: showCorner ? 0 : 30,
//       top: showCorner ? 0 : 30,
//       width: showCorner ? 140 : 80,
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         width: showCorner ? 140 : 80,
//         height: showCorner ? 140 : 80,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Row(
//               mainAxisSize: showCorner ? MainAxisSize.max : MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//             RotatedBox(quarterTurns: 0, child: Image.asset("/assets/images/border_corner.png", width: 25.0,)),
//             RotatedBox(quarterTurns: 1, child: Image.asset("/assets/images/border_corner.png", width: 25.0,)),
//               ],
//             ),
//             Spacer(),
//             Row(
//               mainAxisSize:showCorner ? MainAxisSize.max : MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//             RotatedBox(quarterTurns: 3, child: Image.asset("/assets/images/border_corner.png", width: 25.0,)),
//             RotatedBox(quarterTurns: 2, child: Image.asset("/assets/images/border_corner.png", width: 25.0,)),
//               ],
//             ),
//           ],
//         ),
//       ),

//     );
//   }

  // @override
  // void afterFirstLayout(BuildContext context){
  //   startTimer();
  // }

  // startTimer() {
  //   var duration = Duration(milliseconds: 300);
  //   Timer(duration, showCorners);
  // }

  // showCorners() {
  //   setState(() {
  //     showCorner = true;
  //   });

  // }

}