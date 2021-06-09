import 'package:flutter/material.dart';
import 'package:caphe_v2/shared/header_bar.dart';
import 'package:caphe_v2/shared/background.dart';
import 'package:caphe_v2/screens/register_screen/reg_layout.dart';

class RegisterScreen extends StatelessWidget {

  final List<TextEditingController> controllers = [
    for(int i=0; i<5; i++)
      TextEditingController(), 
  ];
  static final myFocusNode = FocusNode();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(text: Text("Registration Form")),
      body: Center(
        child: Stack(
          children: <Widget>[
            Background(),
            SingleChildScrollView(
              child: RegLayout( controllers, myFocusNode, formKey ),
            )
          ],
        ),
      ),
    );
  }
}