// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String studentIdNumber;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String dateOfBirth;
  String studentClass;
  String documentId;

  Student(
    this.studentIdNumber, 
    this.firstName, 
    this.lastName, 
    this.email,
    this.phoneNumber, 
    this.dateOfBirth, 
    this.studentClass
    );

// formatting for upload to Firbase when creating the student
  Map<String, dynamic> toJson() => {
    'studentIdNumber': studentIdNumber,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'dateOfBirth': dateOfBirth,
    'studentClass': studentClass,
  };

  // creating a Student object from a firebase snapshot
  Student.fromSnapshot(DocumentSnapshot snapshot) :
      studentIdNumber = snapshot['studentIdNumber'],
      firstName = snapshot['firstName'],
      lastName = snapshot['lastName'],
      email = snapshot['email'],
      phoneNumber = snapshot['phoneNumber'],
      dateOfBirth = snapshot['dateOfBirth'].toDate(),
      studentClass = snapshot['studentClass'],
      documentId = snapshot.documentID;
}
