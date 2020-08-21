

import 'package:flutter/material.dart';

class ShowLogo extends StatelessWidget implements PreferredSizeWidget {

  final String showLogo;

  ShowLogo({this.showLogo});

  @override

  Widget build(BuildContext context) {

        return Container(
          child: Padding(
             padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
              child: Center(
                child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/images/logo_color.png'),
                        ),
                  ),
                     ),
                   );

    // return Visibility(
    // child: Container(
    //   child: Padding(
    //     padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[Image.asset('assets/images/logo_color.png'),
    //             ]
    //     ),
    //   ),
    // ),
    //   // visible: visible,
    // );
  }
  
  @override 
  Size get preferredSize => Size.fromHeight(50.0);
  
}
