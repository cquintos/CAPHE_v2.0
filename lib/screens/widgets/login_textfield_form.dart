import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginTextfieldForm extends StatefulWidget {
  @override
  _LoginTextfieldFormState createState() => _LoginTextfieldFormState();
}

class _LoginTextfieldFormState extends State<LoginTextfieldForm> {
  // final _formKey = GlobalKey<FormState>();
  // final _formKeyOTP = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  // final TextEditingController _otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false; 
  var isLoginScreen = false;
  var isOTPScreen = false;
  var verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          style: TextStyle( color: Colors.white, ),
          decoration: InputDecoration(
            icon: Icon(Icons.phone_android, color: Colors.white),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Phone Number", labelStyle: TextStyle(color: Colors.white, fontSize: 15), 
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a number';
            } 
            return null;
          },
        ),
        TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon( Icons.lock, color: Colors.white, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Password", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ]
    );
  }
}