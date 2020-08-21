// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String studentID;
  String firstName;
  String lastName;
  String studentClass;
  // String email;
  // String phoneNumber;
  // String dateOfBirth;
  String documentId;

  Student(
    this.studentID, 
    this.firstName, 
    this.lastName,
    this.studentClass,
    // this.email,
    // this.phoneNumber, 
    // this.dateOfBirth, 
    
    );

// formatting for upload to Firbase when creating the student
  Map<String, dynamic> toJson() => {
    'studentID': studentID,
    'firstName': firstName,
    'lastName': lastName,
    'studentClass': studentClass,
    // 'email': email,
    // 'phoneNumber': phoneNumber,
    // 'dateOfBirth': dateOfBirth,
  };

  // creating a Student object from a firebase snapshot
  Student.fromSnapshot(DocumentSnapshot snapshot) :
      studentID = snapshot['studentID'],
      firstName = snapshot['firstName'],
      lastName = snapshot['lastName'],
      studentClass = snapshot['studentClass'],
      // email = snapshot['email'],
      // phoneNumber = snapshot['phoneNumber'],
      // dateOfBirth = snapshot['dateOfBirth'].toDate(),
      documentId = snapshot.documentID;
}
