import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();

    return Column(
      children: [
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            icon:
                Icon(Icons.phone_android, color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: "Phone Number",
            labelStyle:
                TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: "Password",
            labelStyle:
                TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ]
    );
  }
}