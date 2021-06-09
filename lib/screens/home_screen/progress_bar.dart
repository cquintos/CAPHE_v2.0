import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar(this.index, {Key key}) : super(key: key);
  final int index;

  @override
  _ProgressBarState createState() => _ProgressBarState(this.index);
}

class _ProgressBarState extends State<ProgressBar> {
  _ProgressBarState(this.index);
  int index;
  var labelGroup = new AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    int i = this.widget.index;
    double base = farms[i].isCalculating ? 100 : HEAT_UNITS[farms[i].variety][88];
    double x = farms[i].isCalculating ? 100 : farms[i].currentHeatUnits;
    double _progressvalue = x/base;

    return farms[i].isCalculating ? Loading()
    : Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10,0,10,0),
          child: Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 30,
                child: SfLinearGauge(
                  orientation: LinearGaugeOrientation.horizontal,
                  minimum: 0.0,
                  maximum: 1.0,
                  showTicks: false,
                  showLabels: false,
                  animateAxis: true,
                  axisTrackStyle: LinearAxisTrackStyle(
                    thickness: 30,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    color: Colors.grey.shade700
                  ),
                  barPointers: [
                    LinearBarPointer(
                      value: _progressvalue,
                      thickness: 30,
                      edgeStyle: LinearEdgeStyle.bothCurve,
                      color: Colors.green.shade800
                    ),
                  ],
                )
              )
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text(
              (_progressvalue*100).toStringAsFixed(2) + '%',
              style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),
            ),
          )
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text(
              "COFFEE RIPENING PROGRESS",
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ),
      ]
    );
  }
}