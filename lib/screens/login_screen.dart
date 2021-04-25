import 'package:caphe_v2/screens/widgets/login_announcement.dart';
import 'package:caphe_v2/screens/widgets/background.dart';
import 'package:caphe_v2/screens/widgets/login_footer.dart';
import 'package:caphe_v2/screens/widgets/login_textfield.dart';
import 'package:caphe_v2/screens/widgets/login_title.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            children: <Widget>[
              Expanded(flex:2, child: LoginTitle()),
              Expanded(flex:3, child: LoginTextfield()),
              Expanded(flex:2, child: LoginAnnouncement()),
              Expanded(flex:2, child: LoginFooter()),
            ],
          )
        ],
      ),
    );
  }
}
