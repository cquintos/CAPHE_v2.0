import 'package:caphe_v2/screens/register_screen/register_recap_content.dart';
import 'package:caphe_v2/screens/register_screen/register_recap_title.dart';
import 'package:flutter/material.dart';
import 'register_recap_buttons.dart';

class RegisterRecap extends StatelessWidget {
  final List<TextEditingController> controllers;

  const RegisterRecap(this.controllers, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height*.6,
            width: MediaQuery.of(context).size.width*.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded( flex:1, child: RegisterRecapTitle() ),
                Expanded( flex:1, child: SizedBox(),),
                Expanded( flex:5, child: RegisterRecapContent(controllers), ),
                Expanded( flex:1, child: RegisterRecapButtons(controllers), )
              ],
            ),
          )
        );
      }
    );
  }
}