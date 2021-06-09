import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

class EmptyCardLayout extends StatelessWidget{ 
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    
    return Container (
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: deviceWidth*0.01),
      height: deviceHeight*.3,
      width: deviceWidth*.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [ 
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              NO_FARM_YET,
              maxLines: 1,
              minFontSize: 20,
              stepGranularity: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            AutoSizeText(
              NO_FARM_YET_2,
              maxLines: 3,
              minFontSize: 10,
              stepGranularity: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        )
      ),
    );
  }
}