import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/register_screen/register_screen.dart';
import 'package:caphe_v2/services/authentication_service.dart';

class LoginTextfieldButtons extends StatefulWidget {
  LoginTextfieldButtons( this.isLoading, this.signInControllers, this.signInKey, {Key key}) : super(key: key);
  final bool isLoading;
  final List<TextEditingController> signInControllers;
  final GlobalKey<FormState> signInKey;

  @override
  _LoginTextfieldButtonsState createState() => _LoginTextfieldButtonsState(isLoading);
}

class _LoginTextfieldButtonsState extends State<LoginTextfieldButtons> {
  final AuthenticationService _auth = AuthenticationService();
  bool isLoading;
  _LoginTextfieldButtonsState(isLoading);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: ElevatedButton(
            onPressed: () async {
              if(widget.signInKey.currentState.validate())  {
                setState(() => isLoading = true );
                _auth.signInEmail( 
                  email: widget.signInControllers[0].text, 
                  password: widget.signInControllers[1].text
                );
                setState(() => isLoading = false );
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