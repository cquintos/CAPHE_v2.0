import 'package:caphe_v2/screens/widgets/register_container_button.dart';
import 'package:caphe_v2/screens/widgets/register_container_form.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatefulWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterContainer( this.controllers, this.myFocusNode, this.formKey, {Key key} ) : super(key: key);

  @override
  _RegisterContainerState createState() => _RegisterContainerState( controllers, myFocusNode, formKey );
}

class _RegisterContainerState extends State<RegisterContainer> {
  List<TextEditingController> controllers;
  FocusNode myFocusNode;
  GlobalKey <FormState> formKey;

  _RegisterContainerState( this.controllers, this.myFocusNode, this.formKey );

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(40),
      height: deviceHeight * 0.7,
      width: deviceWidth,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,20,10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded( flex:8, child: RegisterContainerForm( controllers, myFocusNode, formKey), ),
            Expanded( flex:1, child: RegisterContainerButton( controllers, myFocusNode, formKey), ),
          ],
        ),
      ),
    );
  }
}