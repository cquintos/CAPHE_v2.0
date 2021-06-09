import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/screens/home_screen/timeline_panel.dart';
import 'package:caphe_v2/screens/widgets/update_farm_panel.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/screens/widgets/alert_delete_confirmation.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CardDataLeft extends StatefulWidget {
  const CardDataLeft({Key key, this.title, this.index, this.isPressed, this.group}) : super(key: key);
  final String title;
  final bool  isPressed;
  final int index;
  final group;

  @override
  _CardDataLeftState createState() => _CardDataLeftState(this.index, this.isPressed, this.group);
}

class _CardDataLeftState extends State<CardDataLeft> {
  bool isPressed;
  int index;
  var group;
  _CardDataLeftState(this.index, this.isPressed, this.group);

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);

    void _showUpdatePanel(Farm farm) {

      showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*.8,
                padding: EdgeInsets.symmetric(vertical:20, horizontal:20),
                child: UpdateFarmPanel(farm)
              )
            ]
          );
        }
      );
    }

    void _showDeletePanel() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDeleteConfirmation(farms[index].id);
        }
      );
    }

    void _showTimeline() {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(  
            elevation: 15,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.fromLTRB(10,60,10,40),
            child: TimelinePanel(farms[index]),
          );
        }
      );
    }

    return Container(
      child: Column(
        children: <Widget> [
          Expanded(
            flex:3,
            child: ElevatedButton(
              child: Text('SHOW TIMELINE', textAlign: TextAlign.center,),
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade800,
                onPrimary: Colors.white,
              ),
              onPressed: () => _showTimeline(), 
            )
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                farms[index].harvestDate != null 
                  ? this.widget.title
                  : "INSUFFECIENT WEATHER DATA",
                style: TextStyle( 
                  fontSize: 20, 
                  color: farms[index].harvestDate != null 
                    ? Colors.green.shade800 
                    : Colors.black,
                  fontWeight: FontWeight.w500, 
                ),
                minFontSize: 12,
                stepGranularity: 0.1,
                maxLines: farms[index].harvestDate != null
                  ? 1 : 2,
                // group: group,
              )
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                farms[index].harvestDate != null 
                  ? DateFormat.yMMMMd('en_US').format(farms[index].harvestDate)
                  : DateFormat.yMMMMd('en_US').format(farms[index].endDate),
                maxLines: 2,
                stepGranularity: 0.1,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: farms[index].harvestDate != null 
                    ? Colors.black
                    : Colors.red.shade800
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex:3,
            child: Container(
              // color: Colors.green,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    flex:5,
                    child: InkWell(
                      onTap: () => _showUpdatePanel(farms[index]),
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: Colors.white
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.horizontal(left:Radius.circular(8))
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex:5,
                    child: InkWell(
                      onTap: () => _showDeletePanel(),
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.highlight_remove_outlined,
                            size: 30,
                            color: Colors.white,
                          )
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.horizontal(right:Radius.circular(8))
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}