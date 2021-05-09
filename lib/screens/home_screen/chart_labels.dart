import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

class ChartLabels extends StatelessWidget {
  final AutoSizeGroup labelGroup;
  
  ChartLabels(this.labelGroup);


  @override
  Widget build(BuildContext context) {

    Widget _labelContainer(Color color, String label) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Icon(
                  Icons.brightness_1,
                  color: color,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: AutoSizeText(
                label,
                maxLines: 2,
                stepGranularity: 0.1,
                group: this.labelGroup,
                minFontSize: 1,
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            )
          ]
        ),  
      );
    }

    return Container(
      child: Column(
        children: [
          Spacer(),
          Spacer(),
          Expanded( child: _labelContainer(Colors.green, BBCH_STAGES[0]) ),
          Expanded( child: _labelContainer(Colors.yellow, BBCH_STAGES[1]) ),
          Expanded( child: _labelContainer(Colors.orange, BBCH_STAGES[2]) ),
          Expanded( child: _labelContainer(Colors.red, BBCH_STAGES[3]) ),
          Spacer(),
          Spacer(),
        ]
      ),
    );
  }
}