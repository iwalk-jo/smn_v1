

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smn_v1/models/User.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

      Future createUser(User user) async {
        try {
          await _usersCollectionReference.document(user.id).setData(user.toJson());
        } catch (e) {
          return e.message;
        }
      }

      Future getUser(String uid) async {
        try {
          var userData = await _usersCollectionReference.document(uid).get();
          return User.fromData(userData.data);
        } catch (e) {
          return e.message;
        }
      }

      final CollectionReference studentCollection = Firestore.instance.collection('student');

      Future updateStudentData(String studentID, String firstName, String lastName, String studentClass) async {
        return await studentCollection.document(studentID).setData({
          'studentID': studentID,
          'firstName' : firstName,
          'lastName' : lastName,
          'studentClass' : studentClass,
        });
      }
}
