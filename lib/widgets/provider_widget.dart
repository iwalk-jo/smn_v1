import 'package:flutter/material.dart';
import 'package:smn_v1/services/auth_service.dart';

class Provider extends InheritedWidget {
  final AuthService auth;
  Provider({
    Key key,
    Widget child,
    this.auth,
  }) : super(key: key, child: child);

  // final AuthService user;
  // Provider({
  //   Key key,
  //   Widget child,
  //   this.user,
  // }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      // (context.inheritFromWidgetOfExactType(Provider) as Provider);
  (context.dependOnInheritedWidgetOfExactType());
}
