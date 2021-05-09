import 'package:caphe_v2/screens/login_screen/login_announcement.dart';
import 'package:caphe_v2/shared/background.dart';
import 'package:caphe_v2/screens/login_screen/login_footer.dart';
import 'package:caphe_v2/screens/login_screen/login_textfield.dart';
import 'package:caphe_v2/screens/login_screen/login_title.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    
    return isLoading ? Loading() 
    : Scaffold(
        body: Stack(
          children: <Widget>[
            Background(),
            Column(
              children: <Widget>[
                Expanded(flex:2, child: LoginTitle()),
                Expanded(flex:3, child: LoginTextfield(isLoading)),
                Expanded(flex:2, child: LoginAnnouncement()),
                Expanded(flex:2, child: LoginFooter()),
              ],
            )
          ],
        ),
      );
  }
}
