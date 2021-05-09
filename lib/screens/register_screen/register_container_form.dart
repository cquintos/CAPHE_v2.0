import 'package:caphe_v2/screens/register_screen/register_container_form_field.dart';
import 'package:flutter/material.dart';

class RegisterContainerForm extends StatefulWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterContainerForm( this.controllers, this.myFocusNode, this.formKey, {Key key} ) : super(key: key);
  
  @override
   _RegisterContainerFormState createState() => _RegisterContainerFormState( controllers, myFocusNode, formKey );
}

class _RegisterContainerFormState extends State<RegisterContainerForm> {
  List<TextEditingController> controllers;
  FocusNode myFocusNode;
  GlobalKey<FormState> formKey;

  _RegisterContainerFormState( this.controllers, this.myFocusNode, this.formKey, );

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: 
          Wrap (
          children: [
            RegisterContainerFormField(controllers[0], true, Icon(Icons.phone_android, color: Colors.white), "Email Address", myFocusNode, false),
            RegisterContainerFormField(controllers[1], false, Icon(Icons.lock, color: Colors.white), "Password", null, true),
            RegisterContainerFormField(controllers[2], false, Icon(Icons.account_circle, color: Colors.white), "Nickname", null, false),
            SizedBox(height:deviceHeight*0.1),
            RegisterContainerFormField(controllers[3], false, Icon(Icons.location_pin, color: Colors.white), "Street", null, false),
            RegisterContainerFormField(controllers[4], false, Icon( Icons.lock, color: Colors.transparent), "Barangay", null, false),
            RegisterContainerFormField(controllers[5], false, Icon( Icons.lock, color: Colors.transparent), "City", null, false),
            RegisterContainerFormField(controllers[6], false, Icon( Icons.lock, color: Colors.transparent), "Province", null, false),
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