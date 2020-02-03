import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  // Get UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  // Email & Password Sign up student
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String firstName, String lastName, String phone, String studentIdNumber, String dateOfBirth, String studentClass) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Email & Password Sign up parent
    

    // Update the username
    await updateUserName(firstName, lastName, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String firstName, String lastName, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = firstName;
    userUpdateInfo.displayName = lastName;
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

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
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
  }


  class StudentIdNumberValidator {
    static String validate(String value) {
      if(value.isEmpty) {
        return "Phone Number cant't be empty";
      }
      return null;
    }
  }

