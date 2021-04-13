import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartSection extends StatefulWidget {
  ChartSection({Key key}) : super(key: key);

  @override
  _ChartSectionState createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
  @override
  Widget build(BuildContext context) {

    Map<String, double> dataMap = {
      "Infloscence": 3,
      "Flowering": 1,
      "Berry Development": 6,
      "Berry Ripening": 2,
    };

    return Container(
      // height: MediaQuery.of(context).size.height*.8,
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 2.5,
        // colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 20,
        centerText: "GROWTH STAGES",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: false,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      )
    );
  }
}