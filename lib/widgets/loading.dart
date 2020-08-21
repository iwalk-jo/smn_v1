
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import '../theme.dart';
import 'package:smn_v1/theme.dart';

class Loading extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xFF75A2EA),
          size: 50.0,
        ),
      ),
    );
  }
}