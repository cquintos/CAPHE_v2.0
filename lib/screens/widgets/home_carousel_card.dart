import 'package:caphe_v2/screens/widgets/home_carousel_card_content_flex1.dart';
import 'package:flutter/material.dart';
import 'home_carousel_card_content_left.dart';

class CardSection extends StatefulWidget {
  CardSection({Key key}) : super(key: key);

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {

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
      child: Row (
        children: <Widget> [
          Expanded( flex:2, child: CardContentLeft(title: "DAYS LEFT BEFORE HARVEST", data: "295", isPressed: false,), ),
          VerticalDivider(
            color:Colors.green.shade800,
            endIndent: 0,
            indent: 0,
            thickness: 3,
            width: 20,
          ),
          Expanded(
            flex:3,
            child: Container(
              child: Column(
                children: <Expanded> [
                  Expanded( flex:1, child: CardContentFlex1(title: "Batch Name:", data: "MyKopi"), ),
                  Expanded( flex: 1,
                    child: Container(
                      child: Row(
                        children: <Widget> [
                          Expanded( flex: 2, child: CardContentFlex1(title: "Batch:", data: "0001"), ),
                          SizedBox(width:5),
                          Expanded( flex: 3, child: CardContentFlex1(title: "Date Added:", data: "01/28/2021"), ),
                        ]
                      ),
                    ),
                  ),
                  Expanded( flex: 1, child: CardContentFlex1(title: "Species:", data:"ROBUSTA"), ),
                  Expanded( flex: 1, child: CardContentFlex1(title: "Current Growth Stage:", data: "INFLORESCENCE"), ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}