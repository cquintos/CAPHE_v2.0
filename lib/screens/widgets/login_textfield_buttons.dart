import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:caphe_v2/authentication_service.dart';
import 'package:caphe_v2/screens/register_screen.dart';

class LoginTextfieldButtons extends StatelessWidget {
  LoginTextfieldButtons( this.signInControllers, this.signInKey, {Key key}) : super(key: key);
  final List<TextEditingController> signInControllers;
  final GlobalKey<FormState> signInKey;
  final FirebaseAuth _auth = FirebaseAuth.instance; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: ElevatedButton(
            onPressed: () async {
              if(signInKey.currentState.validate())  {
                context.read<AuthenticationService>().emailSignIn(
                  email: signInControllers[0].text,
                  password: signInControllers[1].text,
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