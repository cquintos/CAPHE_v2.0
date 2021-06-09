import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step_title.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

class ManualStage extends StatefulWidget {
  final AutoSizeGroup titleGroup;
  final AutoSizeGroup subtitleGroup;
  final ChoicesWrapper choices;
  ManualStage(this.titleGroup, this.subtitleGroup, this.choices, {Key key}) : super(key: key);

  @override
  _ManualStageState createState() => _ManualStageState(this.titleGroup, this.subtitleGroup, this.choices);
}

class _ManualStageState extends State<ManualStage> {
  _ManualStageState(this.titleGroup, this.subtitleGroup, this.choices);
  AutoSizeGroup titleGroup;
  AutoSizeGroup subtitleGroup;
  ChoicesWrapper choices;
  int _index = 0;
  String imgVariety;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:2, child: StepTitle(FARM_REG_TITLES[2], 2, Colors.green.shade800, 40, widget.titleGroup)),
        Expanded(flex:1, child: StepTitle(FARM_REG_SUBTITLES[1], 2, Colors.black, 20, widget.subtitleGroup)),
        Expanded(
          flex:7,
          child: SizedBox(
            child: PageView.builder(
              itemCount: 4,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState((){
                choices.currentStage = BBCH_STAGES[index].toLowerCase();
                _index = index;
              }),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: _stageCard(BBCH_STAGES[i].toLowerCase(), i, _index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _stageCard(String image, int i, int index) {
    imgVariety = choices.currentVariety == '' ? 'robusta'
      : choices.currentVariety;
    return Card(
      margin: EdgeInsets.all(10),
      color: i==index ? Colors.green.shade800 : Colors.white,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
              Expanded(
              flex:1,
              child: AutoSizeText(
                BBCH_STAGES[i],
                maxLines: 2,
                stepGranularity: 0.1,
                textAlign: TextAlign.center,
                minFontSize: 10,
                style: TextStyle(
                  color: i == index ? Colors.white : Colors.green.shade800,
                  fontSize: 20,
                ),
              )
            ),
            Expanded(
              flex: 5,
              child: Image.asset("assets/${imgVariety.toLowerCase()}/${image.replaceAll(" ", "")}.jpeg"),
            )
          ]
        ),
      )
    );
  }
}