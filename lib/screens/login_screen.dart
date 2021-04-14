import 'package:caphe_v2/screens/widgets/login_announcement.dart';
import 'package:caphe_v2/screens/widgets/background.dart';
import 'package:caphe_v2/screens/widgets/login_footer.dart';
import 'package:caphe_v2/screens/widgets/login_title.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Background(),
            Column(
              children: <Widget>[
                LoginTitle(),
                LoginAnnouncement(),
                LoginFooter(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
