import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'chart_labels.dart';

class HomeChart extends StatefulWidget {
  HomeChart(this.index, {Key key}) : super(key: key);
  final int index;

  @override
  _HomeChartState createState() => _HomeChartState(this.index);
}

class _HomeChartState extends State<HomeChart> {
  _HomeChartState(this.index);
  int index;
  var labelGroup = new AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    int i = this.widget.index; 
    List<double> v = farms[i].bbchDays;
    double sum = farms[i].getTotalDays();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Expanded>[
          Expanded(
            flex: 5,
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 2500,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0, 
                  maximum: sum,
                  labelOffset: 15,
                  labelsPosition: ElementsPosition.outside,
                  ticksPosition: ElementsPosition.outside,
                  axisLineStyle: AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor, 
                    thickness: 0.15
                  ),
                  radiusFactor: 0.9,
                  showTicks: false,
                  showLabels: false,
                  axisLabelStyle: GaugeTextStyle(fontSize: 12),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      angle: 270,
                      positionFactor: 0.5,
                      verticalAlignment: GaugeAlignment.near,
                      widget: Container(
                        child: Column (
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "${(farms[i].variety).toLowerCase()}/${(farms[i].stage).toLowerCase().replaceAll(' ', '')}.jpeg"
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text('${sum-farms[i].days.toDouble()}' +'/' + '$sum days',
                                style: TextStyle(
                                  fontFamily: 'Times',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                                )
                              ),
                            )
                          ]
                        )
                      )
                    )
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: v[0],
                      startWidth: 0.15,
                      endWidth: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.green
                    ),
                    GaugeRange(
                      startValue: v[0],
                      endValue: v[0]+v[1],
                      startWidth: 0.15,
                      endWidth: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.yellow
                    ),
                    GaugeRange(
                      startValue: v[0]+v[1],
                      endValue: v[0]+v[1]+v[2],
                      startWidth: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      endWidth: 0.15,
                      color: Colors.orange
                    ),
                    GaugeRange(
                      startValue:  v[0]+v[1]+v[2],
                      endValue:  v[0]+v[1]+v[2]+v[3],
                      startWidth: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      endWidth: 0.15,
                      color: Colors.red
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: sum-farms[i].days.toDouble(),
                      enableAnimation: true,
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(255, 255, 255, 0),
                          Colors.black
                        ], 
                        stops: <double>[
                          0.25,
                          0.75
                        ], 
                        begin: Alignment.bottomCenter, end: Alignment.topCenter
                      ),
                      animationType: AnimationType.ease,
                      lengthUnit: GaugeSizeUnit.factor,
                      animationDuration: 1300,
                      needleStartWidth: 2,
                      needleEndWidth: 8,
                      needleLength: 0.9,
                      knobStyle: KnobStyle(
                        knobRadius: 0,
                      )
                    ),
                  ]
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ChartLabels(labelGroup),
          )
        ],
      )
    );
  }
}