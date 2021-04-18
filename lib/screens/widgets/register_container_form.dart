import 'package:caphe_v2/screens/widgets/register_container_form_field.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:country_icons/country_icons.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final FirebaseAuth _firebase = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class RegisterContainerForm extends StatefulWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterContainerForm( this.controllers, this.myFocusNode, this.formKey, {Key key} ) : super(key: key);
  
  @override
   _RegisterContainerFormState createState() => _RegisterContainerFormState( controllers, myFocusNode, formKey );
}

class _RegisterContainerFormState extends State<RegisterContainerForm> {
  // // final _formKey = GlobalKey<FormState>();
  // final _formKeyOTP = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
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
            RegisterContainerFormField(controllers[0], true, Icon(Icons.phone_android, color: Colors.white), "Phone Number", myFocusNode),
            RegisterContainerFormField(controllers[1], false, Icon(Icons.account_circle, color: Colors.white), "Nickname", null),
            SizedBox(height:deviceHeight*0.1),
            RegisterContainerFormField(controllers[2], false, Icon(Icons.location_pin, color: Colors.white), "Street", null),
            RegisterContainerFormField(controllers[3], false, Icon( Icons.lock, color: Colors.transparent), "Barangay", null),
            RegisterContainerFormField(controllers[4], false, Icon( Icons.lock, color: Colors.transparent), "City", null),
            RegisterContainerFormField(controllers[5], false, Icon( Icons.lock, color: Colors.transparent), "Province", null),
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