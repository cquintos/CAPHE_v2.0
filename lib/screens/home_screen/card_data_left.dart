import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/screens/widgets/update_farm_panel.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/screens/widgets/alert_delete_confirmation.dart';
import 'package:provider/provider.dart';

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

  String _convertToWeeks(int days) {
    int weeks = (days/7).floor();
    int modulo = days%7;
    String dayNum = days == 0 || (days%7 == 0 && days > 31) ? ""
      : days == 1 ? "$days Day"
      : days <= 7 && days%7 == 1 ? "${modulo.toString()} Day"
      : days > 31 && days%7 == 1 ? "${modulo.toString()} Day \n"
      : days <= 31 ? "$days Days"
      : "${modulo.toString()} Days \n";
    String weekNum = weeks == 0 || days <= 31 ? ""
      : weeks == 1 ? "$weeks Week"
      : "$weeks Weeks";

    return dayNum + weekNum;
  }

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);

    void _showUpdatePanel(Farm farm) {
      showModalBottomSheet(
        context: context, 
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical:20, horizontal:20),
            child: UpdateFarmPanel(farm),
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

    return Container(
      child: Column(
        children: <Expanded> [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                this.widget.title,
                style: TextStyle( fontSize: 24, color: Colors.green.shade700, fontWeight: FontWeight.w300, ),
                minFontSize: 8,
                stepGranularity: 0.1,
                group: group,
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                _convertToWeeks(farms[index].days),
                maxLines: 2,
                stepGranularity: 5,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              alignment: Alignment.center,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <IconButton> [
                    IconButton(
                      icon: (isPressed) ? Icon(Icons.notifications_active, size:ICON_SIZE, ) 
                        : Icon(Icons.notifications, size:ICON_SIZE,),
                      onPressed: () {
                        setState(() {
                          isPressed  = !isPressed;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, size:ICON_SIZE, ),
                      onPressed: () => _showUpdatePanel(farms[index]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size:ICON_SIZE, ),
                      onPressed: () => _showDeletePanel(),
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}