import 'package:caphe_v2/screens/login_screen/login_screen.dart';
import 'package:caphe_v2/screens/navigation_screen/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper ({ Key key }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final _user = context.watch<User>();
  
    return _user == null ? LoginScreen() 
      : NavigationScreen(0, 0);
  }
}