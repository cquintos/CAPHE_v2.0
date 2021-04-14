import 'package:caphe_v2/routing_constants.dart';
import 'package:caphe_v2/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginTextfieldButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, NavigationScreenRoute);
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: Text("Register"),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

            // context.read<AuthenticationService>().signIn(
            //   email: _emailController.text.trim(),
            //   password: _passwordController.text.trim(),
            // );