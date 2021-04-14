import 'package:caphe_v2/screens/widgets/background.dart';
import 'package:caphe_v2/screens/widgets/register_container.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("Registration Form"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Background(),
            RegisterContainer(),
          ],
        ),
      ),
    );
  }
}