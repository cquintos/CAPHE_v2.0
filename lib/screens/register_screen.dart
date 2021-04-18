import 'package:caphe_v2/screens/widgets/background.dart';
import 'package:caphe_v2/screens/widgets/register_container.dart';
import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/widgets/header_bar.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<TextEditingController> controllers = [
    for(int i=0; i<6; i++)
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