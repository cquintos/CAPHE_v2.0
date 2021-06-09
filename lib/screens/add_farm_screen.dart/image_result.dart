import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step_title.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImageResult extends StatefulWidget {
  ImageResult(this.farmName, this.choices, this.titleGroup, this.index);
  final TextEditingController farmName;
  final ChoicesWrapper choices;
  final AutoSizeGroup titleGroup;
  final int index;

  @override
  _ImageResultState createState() => _ImageResultState(
    this.farmName, 
    this.choices, 
    this.titleGroup,
    this.index
  );
}

class _ImageResultState extends State<ImageResult> {
  TextEditingController farmName;
  ChoicesWrapper choices;
  AutoSizeGroup titleGroup;
  int index;

  _ImageResultState(
    this.farmName, 
    this.choices,
    this.titleGroup,
    this.index
  );
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:2, child: StepTitle(FARM_REG_TITLES[4], 2, Colors.green.shade800, 40, titleGroup)),
        Expanded(flex:1, child: StepTitle(FARM_REG_SUBTITLES[3], 2, Colors.black, 15, null)),
        Expanded(
          flex: 10,
          child: ListView(
            children: [
              _tile(Icons.agriculture_rounded, widget.farmName.text, "Name"),
              _tile(Icons.location_pin, widget.choices.location, "Location"),
              _tile(Icons.eco, toBeginningOfSentenceCase(widget.choices.currentVariety.toLowerCase()), "Variety"),
              _tile(Icons.grid_view, "BBCH " + choices.imageFinalBBCH, toBeginningOfSentenceCase(widget.choices.currentStage)),
            ],
          )
        ),
      ],
    );
  }

  Widget _tile(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        tileColor: widget.index == 6 ? Colors.green.shade800 : Colors.transparent,
        title: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
        )),
        subtitle: Text(subtitle,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 15,
        )),
      ),
    );
  }
}