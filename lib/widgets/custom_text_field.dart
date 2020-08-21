

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

final TextEditingController controller;
final String helperText;


const CustomTextField({Key key, @required this.controller, this.helperText})
    : super(key: key);

    @override 
    Widget build(BuildContext context) {
     return Padding(
    padding: const EdgeInsets.all(30.0),
    child: TextField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mode_edit),
        helperText: helperText,
      )
    )
    );
    }

}


// Widget generateTextField(controller, helperText) {
//   Widget textField = Padding(
//     padding: const EdgeInsets.all(30.0),
//     child: TextField(
//       controller: controller,
//       maxLines: 1,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mode_edit),
//         helperText: helperText,
//       )
//     )
//     );
// }