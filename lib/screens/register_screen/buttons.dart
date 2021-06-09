import 'package:caphe_v2/screens/recap_screen/recap_screen.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final List<TextEditingController> controllers;
  final FocusNode myFocusNode;
  final GlobalKey<FormState> formKey;

  Buttons( this.controllers, this.myFocusNode, this.formKey, );  
  
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
                  for(int i = 0; i<5 ; i++)
                    print(controllers[i].text);
                  return showDialog<String> (
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return RecapScreen(controllers);
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
                for(int i=0; i<5; i++)
                  WidgetsBinding.instance.addPostFrameCallback( (_) => controllers[i].clear());
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