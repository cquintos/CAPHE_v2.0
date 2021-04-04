import 'package:flutter/material.dart';

class BackgroundSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.6,
              1,
            ],
            colors: [
              Colors.green.shade800,
              Colors.white,
            ]
          ),
        ),
      ),
    );
  }
}