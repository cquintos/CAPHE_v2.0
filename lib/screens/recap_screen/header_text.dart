import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText(
        "Please kindly check if all your details are correct.",
        maxLines: 2,
        textAlign: TextAlign.center,
        stepGranularity: 2,
        minFontSize: 20,
        style: TextStyle (
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}