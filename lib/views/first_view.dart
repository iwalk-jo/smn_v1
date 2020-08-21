import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:smn_v1/theme.dart';
// import 'package:smn_v1/widgets/app_logo.dart';
import 'package:smn_v1/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  // final primaryColor = const Color(0xFF75A2EA);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;


    Future<bool> _onBackPressed(){
      return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit the app?"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: ()=>Navigator.pop(context,false),
              ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=>Navigator.pop(context,true),
              ),
          ],
        )
      );
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          width: _width,
          height: _height,
          color: Theme.of(context).primaryColor,
          // color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: new BoxConstraints(),
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
            Container(
                  child: Stack(
                    children: <Widget>[
                       Container(
                        padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              width: 400,
                              height: 300,
                              child: Image.asset('assets/images/vertical_logo_name.png')
                            )
                            // ShowLogo(),
                            // CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation(Color(0xFF43a047)),)
                          ],
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      //   child: Text('Hello',
                      //       style: TextStyle(
                      //             fontSize: 80.0, fontWeight: FontWeight.bold)),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                      //   child: Text('There',
                      //       style: TextStyle(
                      //             fontSize: 80.0, fontWeight: FontWeight.bold)),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      //   child: Text('.',
                      //       style: TextStyle(
                      //             fontSize: 80.0,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.green)),
                      //     )
                        ],
                      ),
                    ),


                    SizedBox(height: _height * 0.15),
                    RaisedButton(
                      elevation: defaultTargetPlatform == TargetPlatform.android ? 8.0 : 0.0,
                      // color: Colors.white,
                      color: Theme.of(context).accentColor,
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(
                          "Get Started",
                          style: radioSelectedTextStyle
                          // style: TextStyle(
                          //   // color: primaryColor,
                            // color: Colors.black,
                          //   fontSize: 28,
                          //   fontWeight: FontWeight.w400,
                          // ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Would you like to create an account?",
                            description:
                                  "With an account, your data will be securely saved",
                            primaryButtonText: "Register As Student",
                            primaryButtonRoute: "/signUpStudent",
                            secondaryButtonText: "Register As Parent",
                            secondaryButtonRoute: "/signUpParent",
                            tertiaryButtonText: "Already Registered",
                            tertiaryButtonRoute: "/firstview",
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(height: _height * 0.05),
                    RaisedButton(
                      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
                      // color: Colors.white,
                      // color: Theme.of(context).primaryColor,
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0,),
                        child: Text(
                          "Sign In",
                          // style: TextStyle(
                          //   color: Colors.grey, fontSize: 28, fontWeight: FontWeight.w300),
                          style: radioSelectedTextStyle
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/signIn');
                      },
                    ),

                  ],
                ),
                              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
