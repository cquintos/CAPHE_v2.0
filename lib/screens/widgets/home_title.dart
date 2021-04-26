import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
           Expanded( flex: 1, 
            child: AutoSizeText(
              "YOUR FARMS: ",
              maxLines: 1,
              stepGranularity: 2,
              minFontSize: 20,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded( flex: 1,
            child: ElevatedButton.icon(
              onPressed:() {}, 
              icon: Icon(Icons.arrow_forward_ios_rounded), 
              label: Text("Other Farms")
            ),
          )
        ],
      ),
    );
  }
}