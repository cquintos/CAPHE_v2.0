import 'package:caphe_v2/screens/login_screen/login_announcement.dart';
import 'package:caphe_v2/shared/background.dart';
import 'package:caphe_v2/screens/login_screen/login_footer.dart';
import 'package:caphe_v2/screens/login_screen/login_textfield.dart';
import 'package:caphe_v2/screens/login_screen/login_title.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = PrimaryScrollController.of(context);  
    double heightFactor = MediaQuery.of(context).size.height/9;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Background(),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: <Widget>[
                LimitedBox(maxHeight:heightFactor*2, child: LoginTitle()),
                LimitedBox(maxHeight:heightFactor*3, child: LoginTextfield()),
                LimitedBox(maxHeight:heightFactor*2, child: LoginAnnouncement()),
                LimitedBox(maxHeight:heightFactor*2, child: LoginFooter()),
              ],
            )
          ),
        ],
      ),
    );
  }
}
