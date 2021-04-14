import 'package:flutter/material.dart';

class RegisterContainerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // context.read<AuthenticationService>().signIn(
            //   email: _emailController.text.trim(),
            //   password: _passwordController.text.trim(),
            // );
          },
          child: Text(
            "SUBMIT",
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
            
          },
          child: Text("CLEAR ALL"),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(color: Colors.white),
          ),
        ),
      ],
    );
  }
}