import 'package:caphe_v2/screens/register_screen/textfield.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterForm( this.controllers, this.myFocusNode, this.formKey, {Key key} ) : super(key: key);
  
  @override
   _RegisterFormState createState() => _RegisterFormState( controllers, myFocusNode, formKey );
}

class _RegisterFormState extends State<RegisterForm> {
  List<TextEditingController> controllers;
  FocusNode myFocusNode;
  GlobalKey<FormState> formKey;

  _RegisterFormState( this.controllers, this.myFocusNode, this.formKey, );

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: 
          Wrap (
          children: [
            Field(controllers[0], Icon(Icons.phone_android, color: Colors.white), "Email Address", myFocusNode, false),
            Field(controllers[4], Icon(Icons.lock, color: Colors.white), "Password", null, true),
            Field(controllers[1], Icon(Icons.account_circle, color: Colors.white), "Nickname", null, false),
            SizedBox(height:deviceHeight*0.1),
            Field(controllers[2], Icon(Icons.location_pin, color: Colors.white), "City", null, false),
            Field(controllers[3], Icon(Icons.lock, color: Colors.transparent), "Province", null, false),
            TextFormField(
              style: TextStyle( color: Colors.white, ),
              decoration: InputDecoration(
                icon: Image.asset('icons/flags/png/ph.png', package: 'country_icons', height: 25, width: 25,),
                disabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.transparent) ),
                labelText: "PHILIPPINES", labelStyle: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              enabled: false, 
            ),
          ],
        ), 
      ),
    );
  }
}