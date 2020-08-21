import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smn_v1/theme.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      title: Text(title, style: appBarTextStyle,),
      centerTitle: true,
      backgroundColor: primaryColor,
    );
    
  }
  
  @override 
  Size get preferredSize => Size.fromHeight(50.0);
  
}