import 'package:flutter/material.dart';
import 'package:caphe_v2/services/authentication_service.dart';

class Buttons extends StatelessWidget {
  Buttons( this.controllers, {Key key}) : super(key: key);
  final List<TextEditingController> controllers;
  final otpController = TextEditingController();
  final AuthenticationService _auth = AuthenticationService();

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
              child: Text( "SUBMIT", style: TextStyle( fontWeight: FontWeight.w800, ), ),
              style: ElevatedButton.styleFrom( primary: Colors.green.shade800, onPrimary: Colors.white, ),
              onPressed: () async {
                dynamic result = await _auth.registerEmail(
                  email: controllers[0].text,
                  password: controllers[4].text,
                  nickname: controllers[1].text,
                  municipality: controllers[2].text,
                  province: controllers[3].text  
                );
                if( result != null ) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  print("error");
                }
              },
            ),
          ),
        ),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () { Navigator.of(context, rootNavigator: true).pop(); },
              child: Text("CANCEL", textAlign: TextAlign.center),
              style: ElevatedButton.styleFrom( primary: Colors.red.shade800, onPrimary: Colors.white, ),
            ),
          ),
        ),
      ],
    );
  }
}