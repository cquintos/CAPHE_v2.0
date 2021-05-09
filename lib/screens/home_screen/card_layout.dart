import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/screens/home_screen/card_data.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card_data_left.dart';

class CardLayout extends StatefulWidget {
  CardLayout( this.index, {Key key}) : super(key: key);
  final int index;

  @override
  _CardLayoutState createState() => _CardLayoutState(this.index);
}

class _CardLayoutState extends State<CardLayout> {
  _CardLayoutState(this.index);
  int index;
  
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    final farms = Provider.of<List<Farm>>(context);
    var titleGroup = AutoSizeGroup();
    
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
          Expanded( 
            flex:2, 
            child: Column(
              children:<Expanded> [
                Expanded( flex: 1, child: CardData(title: DATA_TITLES[5], data: farms[index].date, group: titleGroup), ),
                Expanded( flex: 3, child: CardDataLeft(title: DATA_TITLES[0], index: index, isPressed: false, group: titleGroup), ),    
              ],
            )
          ),
          VerticalDivider(
            width: 20,
            indent: 0,
            endIndent: 0,
            thickness: 3,
            color:Colors.green.shade800,
          ),
          Expanded(
            flex:3,
            child: Column(
              children: <Expanded> [
                Expanded( flex: 1, child: CardData(title: DATA_TITLES[1], data: farms[index].name.toUpperCase(), group: titleGroup), ),
                Expanded( flex: 1, child: CardData(title: DATA_TITLES[2], data: farms[index].location.toUpperCase(), group: titleGroup), ),
                Expanded( flex: 1, child: CardData(title: DATA_TITLES[3], data: farms[index].variety.toUpperCase(), group: titleGroup), ),
                Expanded( flex: 1, child: CardData(title: DATA_TITLES[4], data: farms[index].stage.toUpperCase(), group: titleGroup), ),
              ],
            )
          ),
        ],
      ),
    );
  }
}