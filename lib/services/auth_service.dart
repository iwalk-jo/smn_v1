import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smn_v1/models/User.dart';
import 'package:smn_v1/services/firestore_service.dart';
// import 'package:smn_v1/models/User.dart';
// import 'package:smn_v1/services/firestore_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirestoreService _firestoreService = FirestoreService();


  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );



  User _currentUser;
  User get currentUser => _currentUser;
  // Get UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    
    return await _firebaseAuth.currentUser();
  }


String _selectedRole;

String get selectedRole =>_selectedRole;

// void setSelectedRole(String userRole) {
//   _selectedRole = userRole;
//        if (authFormType == AuthFormType.signUpStudent) {
//       _userRole = "isStudent";
//     } else if (authFormType == AuthFormType.signUpParent) {
//       _userRole = "isParent";  
//   }
//   notifyLiteners();
  
// }






  //  create user object based on firebaseUser
  // User _userFromFireBaseUser(FirebaseUser user) {
  //   return user != null ? User(id: user.uid) : null;
  // }

  // Stream<User> get user {
  //   return _firebaseAuth.onAuthStateChanged
  //   // .map((FirebaseUser user) => _userFromFireBaseUser(user));
  //   .map(_userFromFireBaseUser);
  // }














  // Email & Password Sign up student
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String firstName, String lastName, String phone, String studentIdNumber,) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestoreService.createUser(User(
      id: authResult.user.uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
      userRole: _selectedRole,
    ));



//   Future createUserWithEmailAndPassword({
//   String email,
//   String password,
//   String firstName,
//   String lastName,
//   String userRole,
// }) async {
//           try {
//         var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
//               email: email,
//               password: password,
//               // userRole: userRole,
//             );


//             // create a new user profile on firestore
//             _currentUser = User(
//             id: authResult.user.uid,
//             firstName: firstName,
//             lastName: lastName,
//             email: email,
//             userRole: userRole,

//           );
//           await _firestoreService.createUser(_currentUser); 

//           return authResult.user != null;
//   } catch (e) {
//           return e.message;
//         }




    // Email & Password Sign up parent
    

  //   Update the username;
  //   await fullName(firstName, authResult.user);
  //   return authResult.user.uid;
  // }

  // Future fullName(String firstName, FirebaseUser currentUser) async {
  //   var userUpdateInfo = UserUpdateInfo();
  //   userUpdateInfo.displayName = firstName;
  //   // userUpdateInfo.displayName = lastName;
  //   await currentUser.updateProfile(userUpdateInfo);
  //   await currentUser.reload();
  //   return currentUser.uid;
  // }

  // Update the username
    await updateUserName(firstName, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String firstName, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = firstName;
    // userUpdateInfo.displayName = lastName;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  // Email & Password Sign In

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }


// Future signInWithEmailAndPassword({
//   String email,
//   String password,
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




  // Sign Out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
    
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Create Anonymous User
  // Future signInAnonymously() {
  //   return _firebaseAuth.signInAnonymously();
  // }

// Conver User With Email for Anonymous User
  // Future convertUserWithEmail(String email, String password, String firstName, String lastName) async {
  //   final currentUser = await _firebaseAuth.currentUser();

  //   final credential = EmailAuthProvider.getCredential(email: email, password: password);
  //   await currentUser.linkWithCredential(credential);
  //   await updateUserName(firstName, lastName, currentUser);
  // }

  // Future converWithGoogle() async {
  //   final currentUser = await _firebaseAuth.currentUser();
  //   final GoogleSignInAccount account = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication _googleAuth = await account.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     idToken: _googleAuth.idToken,
  //     accessToken: _googleAuth.accessToken,
  //   );
  //   await currentUser.linkWithCredential(credential);
  //   await updateUserName(_googleSignIn.currentUser.displayName, currentUser);
  // }

 // for user role
  Future<bool> isUserLoggedIn() async {
  var user = await _firebaseAuth.currentUser();
  await _populateCurrentUser(user);
    return user != null;
}

Future<bool> isParent() async {
  var user = await _firebaseAuth.currentUser();
    return user != null;
}

Future<bool> isStudent() async {
  var user = await _firebaseAuth.currentUser();
    return user != null;
}


Future _populateCurrentUser(FirebaseUser user) async {
  if(user != null) {
    _currentUser = await _firestoreService.getUser(user.uid);
}
}




  //  Sign In with Google
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    );
    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
  }


 }
class EmailValidator {
    static String validate(String value) {
      if(value.isEmpty) {
        return "Email cant't be empty";
      }
      return null;
    }
  }
  
class NameValidator {
    static String validate(String value) {
      if(value.isEmpty) {
        return "Name cant't be empty";
      }
      if(value.length < 2) {
        return "Name must be at least 2 characters long";
      }
      if(value.length > 50) {
        return "Name must be less than 50 characters long";
      }
      return null;
    }
  }

  class PasswordValidator {
    static String validate(String value) {
      if(value.isEmpty || value.length > 8) {
        return "Password cant't be empty and should be 8+ characters";
      }
      return null;
    }
  }

  // phone number dummy validator

  class PhoneValidator {
    static String validate(String value) {
      if(value.isEmpty) {
        return "Phone Number cant't be empty";
      }
      return null;
    }

       // To enter digits
    // keyboardType: TextInputeType.numberWithOptions(decimal: false),
    // inputFormatters: [

    // WhitelistingTextInputeFormatter.digitsOnly,
    // ]
    // autofocus: true,
  }


  class StudentIdNumberValidator {
    static String validate(String value) {
      if(value.isEmpty) {
        return "Phone Number cant't be empty";
      }
      return null;
    }
  }

