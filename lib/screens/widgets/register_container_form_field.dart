import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class RegisterContainerFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPhone;
  final Icon icon;
  final String label;
  final FocusNode myFocusNode;

  RegisterContainerFormField(
    this.controller,
    this.isPhone,
    this.icon,
    this.label,
    this.myFocusNode,
    {Key key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: isPhone? TextInputType.number : TextInputType.text,
      style: TextStyle( color: Colors.white, ),
      decoration: InputDecoration(
        icon: icon,
        enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
        labelText: label, labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        suffixIcon: IconButton( onPressed: controller.clear, icon: Icon(Icons.clear), ), 
      ),
      textInputAction: TextInputAction.next,
      validator: (String value) {
        if(value.isEmpty) {
          return 'Please answer this field.';
        }
        if(isPhone && (!isNumeric(value) || value.length != 11)) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      onEditingComplete: () => node.nextFocus(),
      focusNode: myFocusNode,
    );
  }
}