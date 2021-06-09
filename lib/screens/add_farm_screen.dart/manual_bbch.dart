import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step_title.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

class ManualBBCH extends StatefulWidget {
  final AutoSizeGroup titleGroup;
  final AutoSizeGroup subtitleGroup;
  final ChoicesWrapper choices;
  ManualBBCH(this.titleGroup, this.subtitleGroup, this.choices, {Key key}) : super(key: key);

  @override
  _ManualBBCHState createState() => _ManualBBCHState(this.titleGroup, this.subtitleGroup, this.choices);
}

class _ManualBBCHState extends State<ManualBBCH> {
  _ManualBBCHState(this.titleGroup, this.subtitleGroup, this.choices);
  AutoSizeGroup titleGroup;
  AutoSizeGroup subtitleGroup;
  ChoicesWrapper choices;
  int _index = 0;
  String imgVariety;

  int _checkCount() {
    return choices.currentStage == "flowering" || choices.currentStage == "berry ripening" ? 3 : 5;
  }

  String _getBBCH(int index) {
    String bbch = '';
    if(index > _checkCount()-1) {
      index = _checkCount() - 1;
      _index = index;
    }
   
    BBCH_STAGES_MAP.forEach((key, value) {
      if(widget.choices.currentStage.toUpperCase() == key) 
        bbch = value.toList()[index].toString();
    });
    return bbch;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:2, child: StepTitle(FARM_REG_TITLES[3], 2, Colors.green.shade800, 40, widget.titleGroup)),
        Expanded(flex:1, child: StepTitle(FARM_REG_SUBTITLES[1], 2, Colors.black, 20, widget.subtitleGroup)),
        Expanded(
          flex:7,
          child: SizedBox(
            child: PageView.builder(
              itemCount: _checkCount(),
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (index) => setState((){
                _index = index;
              }),
              itemBuilder: (context, i) {
                  choices.finalBBCH = _getBBCH(_index);
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: _stageCard(choices.currentStage+" "+((i+1).toString()), i, _index, _getBBCH(i)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _stageCard(String image, int i, int index, String title) {
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
                "BBCH " + title,
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