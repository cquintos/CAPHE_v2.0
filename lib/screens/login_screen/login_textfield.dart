import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/login_screen/login_textfield_form.dart';
import 'package:caphe_v2/screens/login_screen/login_textfield_buttons.dart';

class LoginTextfield extends StatelessWidget {
  static final signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> signInControllers = [
      TextEditingController(), TextEditingController(), 
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(20,10,20,10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(flex:3, child:LoginTextfieldForm(signInControllers, signInKey)),
            Expanded(flex:1, child:LoginTextfieldButtons(signInControllers, signInKey)),
          ],
        ),
      ),
    );
  }
}