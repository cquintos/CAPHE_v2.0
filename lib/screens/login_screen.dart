import 'package:caphe_v2/screens/widgets/login_background.dart';
import 'package:caphe_v2/screens/widgets/login_footer.dart';
import 'package:caphe_v2/screens/widgets/login_textfield.dart';
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
            BackgroundSection(),
            Column(
              children: <Widget>[
                TitleSection(),
                TextfieldSection(),
                FooterSection(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
