import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:smn_v1/theme.dart';
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
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('Hello',
                            style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                        child: Text('There',
                            style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                        child: Text('.',
                            style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          )
                        ],
                      ),
                    ),


                    SizedBox(height: _height * 0.15),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                          ),
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
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.green, fontSize: 28, fontWeight: FontWeight.w300),
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
