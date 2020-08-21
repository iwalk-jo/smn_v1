import 'package:flutter/material.dart';
import 'package:smn_v1/pages/home_page.dart';

import 'package:smn_v1/theme.dart';
import 'package:smn_v1/views/first_view.dart';
import 'package:smn_v1/views/sign_up_view.dart';
import 'package:smn_v1/widgets/provider_widget.dart';
import 'package:smn_v1/services/auth_service.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "SMN V1 App",
        theme: ThemeData(
          primaryColor: primaryColor,
          // primarySwatch: Colors.blue,
          accentColor: const Color(0xFFBDBC55),
          primaryColorBrightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,

        home: HomeController(),

        routes: <String, WidgetBuilder>{
          '/signUpStudent': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUpStudent),
          '/signUpParent': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUpParent),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(), 
          // '/parentPage': (BuildContext context) => HomeController(),
          // '/studentPage': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
