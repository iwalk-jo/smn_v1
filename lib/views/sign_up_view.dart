import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
import 'package:smn_v1/services/auth_service.dart';
// import 'package:smn_v1/views/first_view.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import '../theme.dart';

// final primaryColor = const Color(0xFF75A2EA);


enum AuthFormType { signIn, signUpStudent, signUpParent, reset }

class SignUpView extends StatefulWidget {
  final AuthFormType authFormType;

  SignUpView({Key key, @required this.authFormType}) : super(key: key);

  @override
  _SignUpViewState createState() =>
      _SignUpViewState(authFormType: this.authFormType);
}

class _SignUpViewState extends State<SignUpView> {
  AuthFormType authFormType;
  // bool _showAppleSignIn = false;

  // @override
  // void initState() {
  //   super.initState();

  //   _useAppleSignIn();
  // }

  // _useAppleSignIn() async {
  //   if (Platform.isIOS) {
  //     var deviceInfo = await DeviceInfoPlugin().iosInfo;
  //     var version = deviceInfo.systemVersion;

  //     if (double.parse(version) >= 13) {
  //       setState(() {
  //         _showAppleSignIn = true;
  //       });
  //     }
  //   }
  // }
  _SignUpViewState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _email, _password, _studentIdNumber, _firstName, _lastName, _phone, _dateOfBirth, _studentClass, _warning;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUpStudent") {
      setState(() {
        authFormType = AuthFormType.signUpStudent;
      });
    } else if (state == "signUpParent"){
      setState(() {
        authFormType = AuthFormType.signUpParent;
      });
    }
    // else if (state == 'home') {
    //   Navigator.of(context).pop();
    // }
     else  {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    } 
  }

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
    return false;
    }
  }


  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        switch (authFormType) {
          case AuthFormType.signIn:
          // String uid = 
              await auth.signInWithEmailAndPassword(_email, _password);
              // print("Sign In with ID $uid");
              Navigator.of(context).pushReplacementNamed('/home');
              break;
          case AuthFormType.reset:
              await auth.sendPasswordResetEmail(_email);
              print("Password reset email sent");
              _warning = "A password reset link has been sent to $_email";
              setState(() {
                authFormType = AuthFormType.signIn;
              });
              break;
          case AuthFormType.signUpStudent:
          // String uid =
              await auth.createUserWithEmailAndPassword(_email, _password, _studentIdNumber, _firstName, _lastName, _dateOfBirth, _phone, _studentClass);
              // print("Signed Up with New ID $uid");
              Navigator.of(context).pushReplacementNamed('/home');
              break;
          case AuthFormType.signUpParent:
          // String uid =
              await auth.createUserWithEmailAndPassword(_email, _password, null, _firstName, _lastName, null, _phone, null);
              // print("Signed Up with New ID $uid");
              Navigator.of(context).pushReplacementNamed('/home');
              break;
        }
      } catch (e) {
        print(e);
        setState(() {
          _warning = e.message;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
     
    // if (authFormType == AuthFormType.anonymous) {
    //   submitAnonymous();
    //   return Scaffold(
    //     backgroundColor: primaryColor,
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         SpinKitDoubleBounce(color: Colors.white,),
    //         Text("Loading", style: TextStyle(color: Colors.white),),
    //       ],
    //     )
    //   );
    // } else {}

    // Future<bool> _onBackPressed(){
    //   return showDialog(
    //     context: context,
    //     builder: (context)=>AlertDialog(
    //       title: Text("Do you really want to exit the app?"),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: Text("No"),
    //           onPressed: ()=>Navigator.pop(context,false),
    //           ),
    //         FlatButton(
    //           child: Text("Yes"),
    //           onPressed: ()=>Navigator.pop(context,true),
    //           ),
    //       ],
    //     )
    //   );
    // }
 
    return Scaffold(
        body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          color: Theme.of(context).primaryColor,
          height: _height,
          width: _width,
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
              Column(
  
                 mainAxisAlignment: MainAxisAlignment.center,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  children: <Widget>[
  
                    SizedBox(height: _height * 0.025),
  
                    showAlert(),
  
                    SizedBox(height: _height * 0.025),
  
                    buildHeaderText(),
  
                    SizedBox(height: _height * 0.05),
  
                    Padding(
  
                      padding: const EdgeInsets.all(20.0),
  
                      child: Form(
  
                        key: formKey,
  
                        child: Column(
  
                          children: buildInputs() + buildButtons(),
  
                        ),
  
                      ),
  
                    ),
  
                  ],
  
                ),
],
            ),
          ),
        ),
      ),
   );
    
  }

 

  Widget showAlert() {
    if(_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(child: AutoSizeText(_warning, maxLines: 3,),),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0,);
  }

  AutoSizeText buildHeaderText() {
    String _headerText;
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Sign In";
    } else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset Password";  
    } else if (authFormType == AuthFormType.signUpStudent) {
      _headerText = "Create Student Account";
    } else if (authFormType == AuthFormType.signUpParent) {
      _headerText = "Create Parent Account";
    }
    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: mediumTextStyle
    );
  }



// reset password
  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    
    if (authFormType == AuthFormType.reset) {
      textFields.add(
        TextFormField(
          validator: EmailValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
        ),
      );
      textFields.add(SizedBox(height: 10));
      return textFields;
    }

    // if we are in the sign up state add name
    if ([AuthFormType.signUpParent].contains(authFormType)) {
      textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("First Name"),
          onSaved: (value) => _firstName = value,
        ),
      );
      textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Last Name"),
          onSaved: (value) => _lastName = value,
        ),
      );
      
      textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          validator: PhoneValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Phone Number"),
          onSaved: (value) => _phone = value,
        ),
      );
      textFields.add(SizedBox(height: 10));
       // add email & password
    textFields.add(
      TextFormField(
        validator: EmailValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );
    textFields.add(SizedBox(height: 10));
    textFields.add(
      TextFormField(
        validator: PasswordValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Password"),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    );

    textFields.add(SizedBox(height: 10));

    return textFields;

    } 
    
    
    if ([AuthFormType.signUpStudent].contains(authFormType)) {
      textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("First Name"),
          onSaved: (value) => _firstName = value,
        ),
      );

      textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Last Name"),
          onSaved: (value) => _lastName = value,
        ),
      );

      textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Phone Number"),
          onSaved: (value) => _phone = value,
        ),
      );

       textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          validator: StudentIdNumberValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Student Id Number"),
          onSaved: (value) => _studentIdNumber = value,
        ),
      );

       textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Date Of Birth"),
          onSaved: (value) => _dateOfBirth = value,
        ),
      );
        textFields.add(SizedBox(height: 10));

       textFields.add(
        TextFormField(
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Class"),
          onSaved: (value) => _studentClass = value,
        ),
      );

      textFields.add(SizedBox(height: 10));
       // add email & password
    textFields.add(
      TextFormField(
        validator: EmailValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );

    textFields.add(SizedBox(height: 10));

    textFields.add(
      TextFormField(
        validator: PasswordValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Password"),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    );

    textFields.add(SizedBox(height: 10));

    return textFields;

    }

    // add email & password

    textFields.add(
      TextFormField(
        validator: EmailValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );
    textFields.add(SizedBox(height: 10));
    textFields.add(
      TextFormField(
        validator: PasswordValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Password"),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    );

    textFields.add(SizedBox(height: 10));

    return textFields;
  }

  

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
       hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
          fontFamily: "Lato",
        ),
      
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;
    bool _showSocial = true;

    // if (authFormType == AuthFormType.signIn) {
    //   _switchButtonText = "Create New Student Account";
    //   _newFormState = "signUpStudent";
    //   _submitButtonText = "Sign In As Student";
    // } else {
    //   _switchButtonText = "Have an Account? Sign In";
    //   _newFormState = "signIn";
    //   _submitButtonText = "Sign Up As Student";
    // }

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = "Don't Have An Account ?";
      _newFormState = "/firstview";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset) {
      _switchButtonText = "Return to Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Submit";
      _showSocial = false;
    } else if (authFormType == AuthFormType.signUpStudent) {
      _switchButtonText = "Register As Parent";
      _newFormState = "signUpParent";
      _submitButtonText = "Submit";
    } else if (authFormType == AuthFormType.signUpParent){
      _switchButtonText = "Register As Student";
      _newFormState = "signUpStudent";
      _submitButtonText = "Submit";
    } else {
      _switchButtonText = "Have an Account? Sign In";
      _newFormState = "signIn";
      _submitButtonText = "*Sign Up*";
    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          textColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _submitButtonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
            ),
          ),
          onPressed: submit,
        ),
      ),
      showForgotPassword(_showForgotPassword),
      FlatButton(
        child: Text(
          _switchButtonText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          switchFormState(_newFormState);
        },
      ),
       buildSocialIcons(_showSocial),
    ];
  }

  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            authFormType =AuthFormType.reset;
          });
        },
      ),
      visible: visible,
    );
  }

  Widget buildSocialIcons(bool visible) {
    final _auth = Provider.of(context).auth;
    return Visibility(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(color: Colors.white,),
              SizedBox(height: 10),
              GoogleSignInButton(
                onPressed: () async {
                  try {
                    await _auth.signInWithGoogle();
                    Navigator.of(context).pushReplacementNamed('/home');
                  } catch (e) {
                    setState(() {
                      _warning = e.message;
                    });
                  }
                },
              )
            ],
          ),
          visible: visible,
        );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('_error', _warning));
  // }
}
