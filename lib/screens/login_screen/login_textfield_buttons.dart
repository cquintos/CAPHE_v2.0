import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/register_screen/register_screen.dart';
import 'package:caphe_v2/services/authentication_service.dart';

class LoginTextfieldButtons extends StatelessWidget {
  LoginTextfieldButtons(this.signInControllers, this.signInKey, {Key key}) : super(key: key);
  final List<TextEditingController> signInControllers;
  final GlobalKey<FormState> signInKey;
  final AuthenticationService _auth = AuthenticationService();


  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: ElevatedButton(
            onPressed: () async {
              print("wew"); 
              if(signInKey.currentState.validate())  {
                _auth.signInEmail( 
                  email: signInControllers[0].text, 
                  password: signInControllers[1].text
                );
              }
            },
            child: Text(
              "SIGN IN",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
          ),
        ),
        FittedBox(
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Text("Register"),
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}