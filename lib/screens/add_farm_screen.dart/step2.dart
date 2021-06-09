import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step_title.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  Step2(this.index, this.choices, this.titleGroup, this.subtitleGroup, {Key key}) : super(key: key);
  final int index;
  final ChoicesWrapper choices;
  final AutoSizeGroup titleGroup;
  final AutoSizeGroup subtitleGroup;

  @override
  _Step2State createState() => _Step2State(this.index, this.choices, this.titleGroup, this.subtitleGroup);
}

class _Step2State extends State<Step2> {
  int index;
  ChoicesWrapper choices;
  _Step2State(this.index, this.choices, this.titleGroup, this.subtitleGroup);
  bool manual = false;
  bool imgproc = false;
  AutoSizeGroup titleGroup;
  AutoSizeGroup subtitleGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:2, child: StepTitle(FARM_REG_TITLES[1], 2, Colors.green.shade800, 40, widget.titleGroup)),
        Expanded(flex:1, child: StepTitle(FARM_REG_SUBTITLES[0], 2, Colors.black, 20, widget.subtitleGroup)),
        Spacer(),
        Expanded(
          flex:6,
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  setState(() {
                    if(manual) manual = !manual;
                    widget.choices.jump = 4;
                    imgproc = true; 
                  });
                },
                tileColor: widget.index==1 && imgproc ? Colors.green.shade800
                  : widget.index ==1 ? Colors.grey.shade200
                  : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                isThreeLine: true,
                leading: Icon(
                  Icons.photo_camera,
                   color: imgproc ? Colors.white : Colors.green.shade800
                ),
                title: Text("Upload Image",
                  style: TextStyle( 
                   fontSize: 20,
                   color: imgproc ? Colors.white : Colors.green.shade800
                  )
                ),
                subtitle: Text("Kindly upload an image of your coffee plant!",
                  style: TextStyle(
                    color: imgproc ? Colors.white70 : Colors.grey.shade800,
                  ),
                ),
              ), 
              Divider(
                height: 30,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile( 
                onTap: () {
                  setState(() {
                    if(imgproc) imgproc = !imgproc;
                    widget.choices.jump = 1;
                    manual = true; 
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                isThreeLine: true,
                tileColor: widget.index==1 && manual ? Colors.green.shade800
                  : widget.index ==1 ? Colors.grey.shade200
                  : Colors.transparent,
                leading: Icon(
                  Icons.grid_view,
                  color: manual ? Colors.white : Colors.green.shade800
                ),
                title: Text("Manual Selection",
                 style: TextStyle(
                   fontSize: 20,
                   color: manual ? Colors.white : Colors.green.shade800
                 ),
                ),
                subtitle: Text("Just pick the image closest to your plant!",
                  style: TextStyle(
                    color: manual ? Colors.white70 : Colors.grey.shade800,
                  ),
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}