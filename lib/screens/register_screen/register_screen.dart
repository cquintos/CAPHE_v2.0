import 'package:flutter/material.dart';
import 'package:caphe_v2/shared/header_bar.dart';
import 'package:caphe_v2/shared/background.dart';
import 'package:caphe_v2/screens/register_screen/register_container.dart';

class RegisterScreen extends StatelessWidget {

  final List<TextEditingController> controllers = [
    for(int i=0; i<7; i++)
      TextEditingController(), 
  ];
  final myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(text: Text("Registration Form")),
      body: Center(
        child: Stack(
          children: <Widget>[
            Background(),
            RegisterContainer( controllers, myFocusNode, formKey ),
          ],
        ),
      ),
    );
  }
}