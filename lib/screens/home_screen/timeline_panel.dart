import 'package:caphe_v2/models/event.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TimelinePanel extends StatefulWidget {
  TimelinePanel(this.farm, {Key key}) : super(key: key);
  Farm farm;

  @override
  _TimelinePanelState createState() => _TimelinePanelState(this.farm);
}

class _TimelinePanelState extends State<TimelinePanel> {
  _TimelinePanelState(this.farm);
  Farm farm;

  bool isStage(String accused) {
    bool verdict = false;
    BBCH_STAGES.forEach((e) {
      if(accused == e)
        verdict = true;
    });
    return verdict;
  }

  List<TimelineModel> childList() {
    List<TimelineModel> result = List.empty(growable:true);
    List<Event> e = farm.events;
    
    for(int i = 0; i < e.length; i++) {
      result.add(
        TimelineModel(
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: e[i].color,
            ),
            padding: EdgeInsets.fromLTRB(6,10,6,10),
            width: double.infinity,
            child: Column(
              children: [
                Align(
                  alignment: i%2 != 0 ? Alignment.centerLeft : Alignment.centerRight,
                  child: Text(
                    e[i].date,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),                    
                  ),
                ),
                SizedBox(height:10),
                isStage(e[i].name.toUpperCase()) 
                ? Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'assets/${farm.variety.toLowerCase()}/${e[i].name.replaceAll(" ", "").toLowerCase()}.jpeg',
                      height: 120.0,
                      fit: BoxFit.contain,
                    )
                  )
                : e[i].hasPic 
                ? Container(
                    margin: EdgeInsets.all(2),
                    child: Image.asset(
                      'assets/${e[i].name.replaceAll(" ", "").toLowerCase()}.jpeg',
                      height: 120.0,
                      fit: BoxFit.contain,
                    )
                  )
                : SizedBox.shrink(), 
                Text(
                  e[i].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),   
                )
              ],
            ),
          ),
          position: i%2 != 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
          iconBackground: e[i].color,
          icon: Icon(
            e[i].type == "Inflorescence"
            ? Icons.grass 
            : e[i].type == "Flowering"
            ? Icons.local_florist
            : e[i].type == "Berry development"
            ? Icons.local_library_rounded
            : e[i].type == "Berry ripening"
            ? Icons.bubble_chart
            : e[i].icon,
            color: Colors.white,
          )     
        )
      );
      if(e[i].tip != "") {
        result.add(
          TimelineModel(
            Container(
              margin: EdgeInsets.symmetric(vertical:6),
              padding: EdgeInsets.fromLTRB(6,10,6,10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    e[i].tip,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),   
                  )
                ],
              ),
            ),
            position: i%2 != 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
            iconBackground: Colors.amber,
            icon: Icon(
              Icons.lightbulb,
              color: Colors.white,
            )     
          )
        );
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade800,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Farm ${farm.name}'s timeline: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),  
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(8,8,8,0),
              child: Timeline(
                lineColor: Colors.grey.shade800,
                shrinkWrap: true,
                children: childList(),
                position: TimelinePosition.Center,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child:  Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                child: Text('close'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.grey.shade800,
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
