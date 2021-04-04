import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardContentLeft extends StatelessWidget {
  const CardContentLeft({Key key, this.title, this.data}) : super(key: key);
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Expanded> [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topRight,
              child: AutoSizeText(
                this.title,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                this.data,
                maxLines: 1,
                stepGranularity: 10,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}