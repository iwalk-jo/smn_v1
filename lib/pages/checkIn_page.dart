// import 'dart:async';

// import 'package:after_layout/after_layout.dart';
// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smn_v1/models/Student.dart';
import 'package:smn_v1/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smn_v1/widgets/app_bar.dart';
// import 'package:smn_v1/widgets/toggle_widget.dart';
// import 'package:smn_v1/widgets/student_card.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckInPage extends StatefulWidget {
  // QRcodePage({Key key}) : super(key: key);

  final Student student;



  @override
  CheckInPage({@required this.student});


  CheckInPageState createState() => CheckInPageState();
}

class CheckInPageState extends State<CheckInPage> {
      // bool showCorner = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
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


          Expanded(
            flex: 12, 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
                child: Center(
                  child: Container(   
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  margin: EdgeInsets.only(left:30, right:30, top:50, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 251, 252),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.45), blurRadius: 30, offset: Offset(0, 10))]
                  ),
                  child: Column(
                    
                    // Centered Box
                    children: <Widget>[

                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: <Widget>[
             

                          Expanded(
                              flex: 2,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: <Widget>[
                                     FlatButton(
                                        // shape:
                                        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                          color: Colors.tealAccent[100],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Check-In-QR", style: buttonTextStyle),
                                          
                                        ),
                                        onPressed: () {
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          //     return QRcodePage(student: student);
                                          //   }));
                                        },
                                      ),
                                   ],
                                 ),
                       
                                )
                            ],)
                        ),),




                      Expanded(
                        flex: 8,
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

                        // Replace with student Name
                        Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: <Widget>[
                               Text('student.firstName', style: TextStyle(
                                  fontSize: 20, color: Colors.black
                                  )),
                          ],),
                        )
                      
                              )
                  ],
                  )
                  
              ),
                ),
            ),
          ),
          Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                            //  Text("Scan the QRcode", style: TextStyle(
                            //     fontSize: 20, color: Colors.black
                            //     )),
                              RaisedButton(
                                        // shape:
                                        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                          color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Home", style: buttonTextStyle),
                                          
                                        ),
                                        onPressed: () {
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          //     return HomePage(student: student);
                                          //   }));
                                          Navigator.of(context).pushReplacementNamed('/home');
                                        },
                                      ),
                        ],),
                      )
                    
                            )

        ],
      ),
    );
  }

  }
