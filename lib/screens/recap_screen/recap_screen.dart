import 'package:caphe_v2/screens/recap_screen/content.dart';
import 'package:caphe_v2/screens/recap_screen/header_text.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

class RecapScreen extends StatelessWidget {
  final List<TextEditingController> controllers;

  const RecapScreen(this.controllers, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height*.65,
            width: MediaQuery.of(context).size.width*.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded( flex:1, child: HeaderText() ),
                Expanded( flex:5, child: Content(controllers), ),
                Expanded( flex:1, child: Buttons(controllers), )
              ],
            ),
          )
        );
      }
    );
  }
}