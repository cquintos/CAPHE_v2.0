import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardData extends StatefulWidget {
  const CardData({Key key, this.title, this.data, this.group}) : super(key: key);

  final String title;
  final String data;
  final group;
  @override
  _CardDataState createState() => _CardDataState(this.title, this.data, this.group);
}

class _CardDataState extends State<CardData> {
  _CardDataState(this.title, this.data, this.group);
  String title;
  String data;
  var group;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Expanded> [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                this.widget.title,
                style: TextStyle( fontSize: 24, color: Colors.green.shade700, fontWeight: FontWeight.w300, ),
                minFontSize: 8,
                stepGranularity: 0.1,
                group: group,
              )
            ),
          ),
          Expanded(
            flex:2, 
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                this.widget.data,
                style: TextStyle( fontSize: 20, ),
                maxLines: 1,
                minFontSize: 10,
                stepGranularity: 0.1,
              ),
            ),
          ),
        ],
      )
    );
  }
}