import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String label;
  final FocusNode myFocusNode;
  final bool isPassword;

  Field(
    this.controller,
    this.icon,
    this.label,
    this.myFocusNode,
    this.isPassword,
    {Key key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: TextStyle( color: Colors.white, ),
      obscureText: isPassword,
      decoration: InputDecoration(
        icon: icon,
        enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
        labelText: label, labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        suffixIcon: IconButton( 
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback( (_) => controller.clear());
          }, 
          icon: Icon(Icons.clear), 
        ), 
      ),
      textInputAction: label == 'Province' ? TextInputAction.done : TextInputAction.next,
      validator: (String value) {
        return value.isEmpty ? 'Please answer this field.' : null;
      },
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      focusNode: myFocusNode,
    );
  }
}