import 'package:flutter/material.dart';

class LoginTextfieldForm extends StatelessWidget {
  LoginTextfieldForm( this.signInControllers, this.signInKey, {Key key}) : super(key: key);
  final List<TextEditingController> signInControllers;
  final GlobalKey<FormState> signInKey;
  static final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Form(
        key: signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: signInControllers[0],
              style: TextStyle( color: Colors.white, ),
              decoration: InputDecoration(
                isDense: true,
                icon: Icon(Icons.phone_android, color: Colors.white),
                enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                labelText: "Email Address", labelStyle: TextStyle(color: Colors.white, fontSize: 15), 
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              validator: (value) {
                if(value.isEmpty)  return 'Please enter an email';
              },
              focusNode: myFocusNode,
            ),
            TextFormField(
              controller: signInControllers[1],
              keyboardType: TextInputType.text,
              style: TextStyle( color: Colors.white, ),
              obscureText: true,
              decoration: InputDecoration(
                isDense: true,
                icon: Icon( Icons.lock, color: Colors.white, ),
                enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                labelText: "Password", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                return value.isEmpty ? 'Please enter your password' : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}