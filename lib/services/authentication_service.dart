
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// import 'package:smn_v1/models/User.dart';
// import 'package:smn_v1/services/firestore_service.dart';

// class AuthenticationService {

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// final FirestoreService _firestoreService = FirestoreService();

// User _currentUser;
// User get currentUser => _currentUser;



// Future loginWithEmail({
//   @required String email,
//   @required String password,
// }) async {
//   try {
//     var authResult = await _firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     await _populateCurrentUser(authResult.user);
//     return authResult.user != null;
//   } catch (e) {
//     return e.message;
//   }
// }


// Future signUpWithEmail({
//   @required String email,
//   @required String password,
//   @required String fullName,
//   @required String role,
// }) async {
//   try {
//         var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
//               email: email,
//               password: password,
//               // role: role,
//               // userRole: userRole,
//             );


//             // create a new user profile on firestore
//             _currentUser = User(
//             id: authResult.user.uid,
//             fullName: fullName,
//             email: email,
//             userRole: role,

//           );
//           await _firestoreService.createUser(_currentUser); 

//           return authResult.user != null;
//   } catch (e) {
//           return e.message;
//         }


//         // await updatefullName(firstName, authResult.user);
//         // return authResult.user.uid;
// }




// Future<bool> isUserLoggedIn() async {
//   var user = await _firebaseAuth.currentUser();
//   await _populateCurrentUser(user);
//     return user != null;
// }

// Future<bool> isParent() async {
//   var user = await _firebaseAuth.currentUser();
//     return user != null;
// }

// Future<bool> isStudent() async {
//   var user = await _firebaseAuth.currentUser();
//     return user != null;
// }


// Future _populateCurrentUser(FirebaseUser user) async {
//   if(user != null) {
//     _currentUser = await _firestoreService.getUser(user.uid);
// }
// }

// }