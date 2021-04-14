import 'package:flutter/material.dart';

class HomeCarouselTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text("YOUR FARMS: ",
            style: TextStyle(
              fontSize: deviceWidth*0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text("Other farm", 
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          )
        ],
      ),
    );
  }
}