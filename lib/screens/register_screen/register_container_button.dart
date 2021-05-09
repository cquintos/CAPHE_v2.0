import 'package:caphe_v2/screens/register_screen/register_recap.dart';
import 'package:flutter/material.dart';

class RegisterContainerButton extends StatelessWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  RegisterContainerButton( this.controllers, this.myFocusNode, this.formKey, );  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {
                if(formKey.currentState.validate()) {
                  return showDialog<String> (
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return RegisterRecap(controllers);
                    }
                  );
                }
              },
              child: Text( "SUBMIT", style: TextStyle( fontWeight: FontWeight.w800, ), ),
              style: ElevatedButton.styleFrom( primary: Colors.white, onPrimary: Colors.black, ),
            ),
          ),
        ),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: OutlinedButton(
              onPressed: () {
                for(int i=0; i<6; i++)
                  controllers[i].clear();
                myFocusNode.requestFocus();
              },
              child: Text("CLEAR ALL", textAlign: TextAlign.center),
              style: OutlinedButton.styleFrom( primary: Colors.white, side: BorderSide(color: Colors.white), ),
            ),
          ),
        ),
      ],
    );
  }
}