// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Attendance {
  // String studentID;
  String attendanceID;
  DateTime checkIn;
  DateTime checkOut;
  

  Attendance(
    this.attendanceID, 
    this.checkIn, 
    this.checkOut, 
    );

// formatting for upload to Firbase when creating the student
  Map<String, dynamic> toJson() => {
    'attendanceID': attendanceID,
    'checkIn': checkIn,
    'checkOut': checkOut,
  };

  // creating a Student object from a firebase snapshot
  Attendance.fromSnapshot(DocumentSnapshot snapshot) :
      attendanceID = snapshot['attendanceID'],
      checkIn = snapshot['checkIn'],
      checkOut = snapshot['checkOut'];
      
}
