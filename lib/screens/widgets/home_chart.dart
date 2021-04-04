import 'package:flutter/material.dart';


class ChartSection extends StatefulWidget {
  ChartSection({Key key}) : super(key: key);

  @override
  _ChartSectionState createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height*.8,
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      child: Text("Chart here po"),
    );
  }
}