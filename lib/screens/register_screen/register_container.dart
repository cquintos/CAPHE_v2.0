import 'package:caphe_v2/screens/register_screen/register_container_button.dart';
import 'package:caphe_v2/screens/register_screen/register_container_form.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatelessWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterContainer( 
    this.controllers, 
    this.myFocusNode, 
    this.formKey, 
    {Key key} 
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(40),
      height: size.height * 0.7,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,20,10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded( flex:6, child: RegisterContainerForm( controllers, myFocusNode, formKey), ),
            Expanded( flex:1, child: RegisterContainerButton( controllers, myFocusNode, formKey), ),
          ],
        ),
      ),
    );
  }
}