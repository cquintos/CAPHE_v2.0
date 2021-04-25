import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( flex:3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/coffee1.png"),
                fit: BoxFit.fitHeight,
               )
              ),
            ),
          ),
          Expanded( flex:3,
            child: Center(
              child: AutoSizeText(
                "C A P H E",
                stepGranularity: 2,
                minFontSize: 10,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle( 
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Expanded( flex:1,
            child: AutoSizeText(
              "COFFEE APP HARVEST ESTIMATOR VERSION 2.0",
              stepGranularity: 2,
              minFontSize: 2,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey, 
                fontSize: 50,
              ),
            ) 
          )
        ],
      ),
    );
  }
}