import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeCarouselCardContentFlex1 extends StatelessWidget {

  final String title;
  final String data;

  const HomeCarouselCardContentFlex1({Key key, this.title, this.data}) : super(key: key);
 
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
                this.title,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w300,
                ),
                minFontSize: 8,
                stepGranularity: 2,
              )
            ),
          ),
          Expanded(
            flex:2, 
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                this.data,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, 
                ),
                maxLines: 1,
                minFontSize: 10,
                stepGranularity: 5,
              ),
            ),
          ),
        ],
      )
    );
  }
}