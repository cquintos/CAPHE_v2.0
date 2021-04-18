import 'package:caphe_v2/screens/widgets/login_textfield_buttons.dart';
import 'package:caphe_v2/screens/widgets/login_textfield_form.dart';
import 'package:flutter/material.dart';

class LoginTextfield extends StatefulWidget {
  @override
  _LoginTextfieldState createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    
    return Container(
      margin: EdgeInsets.fromLTRB(20,10,20,10),
      height: deviceHeight * 0.3,
      width: deviceWidth,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LoginTextfieldForm(),
            LoginTextfieldButtons(),
          ],
        ),
      ),
    );
  }
}