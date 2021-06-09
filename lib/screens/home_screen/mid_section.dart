import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MidSection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final farms = Provider.of<List<Farm>>(context);
    final cities = Provider.of<List<City>>(context);
    int readyCount = farms.where((farm) => farm.bbch>=88).toList().length;
    int stage0Count = farms.where((farm) => farm.stage==BBCH_STAGES[0]).toList().length;
    int stage1Count = farms.where((farm) => farm.stage==BBCH_STAGES[1]).toList().length;
    int stage2Count = farms.where((farm) => farm.stage==BBCH_STAGES[2]).toList().length;
    int stage3Count = farms.where((farm) => farm.stage==BBCH_STAGES[3]).toList().length;
    
    Widget _mainCard(IconData icon, String data, String title, Color color, Color textColor, double elevation) {
      double size = MediaQuery.of(context).size.width;
      return Container(
        margin: EdgeInsets.fromLTRB(2,5,2,5),
        child: Card(
          color: int.parse(data) == 0 ? Colors.white : color,
          elevation: elevation,
          child: Container(
            width: size*.4,
            height: size*.4,
            padding: EdgeInsets.all(10),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    int.parse(data) == 0 ? Icons.label : icon,
                    size: 35,
                    color:  int.parse(data) == 0 ? Colors.green.shade800 : textColor
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AutoSizeText(
                    data,
                    stepGranularity: 0.1,
                    minFontSize: 15,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color:  int.parse(data) == 0 ? Colors.green.shade800 : textColor
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: AutoSizeText(
                    title,
                    // stepGranularity: 0.1,
                    textAlign: TextAlign.left,
                    minFontSize: 8,
                    maxLines: 2,
                    // group: titleGroup,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color:  int.parse(data) == 0 ? Colors.green.shade800 : textColor
                    )
                  ),
                )
              ]
            ),
          ),
        ),
      );
    }

    Widget _card(IconData icon, String data, String title, Color color, Color textColor) {
      double size = MediaQuery.of(context).size.width;
      return Container(
        margin: EdgeInsets.fromLTRB(2,5,2,5),
        child: Card(
          color: int.parse(data) == 0 ? Colors.white : color,
          elevation: 10,
          child: Container(
            width: size*.4,
            height: size*.2,
            padding: EdgeInsets.all(10),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: AutoSizeText(
                    data,
                    stepGranularity: 0.1,
                    minFontSize: 15,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color:  int.parse(data) == 0 ? Colors.green.shade800 : textColor
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex:6,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      title,
                      // stepGranularity: 0.1,
                      textAlign: TextAlign.left,
                      minFontSize: 8,
                      maxLines: 2,
                      // group: subGroup,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color:  int.parse(data) == 0 ? Colors.green.shade800 : textColor
                      )
                    ),
                  ),
                )
              ]
            ),
          ),
        ),
      );
    }

    return cities == null || farms == null ? Loading()
      : Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,00,20,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _mainCard(
                          Icons.agriculture_rounded,
                          // "0", 
                          farms.length.toString(), 
                          "COFFEE FARMS\nTOTAL", 
                          Colors.white,
                          Colors.green.shade800,
                          20
                        ),
                        _mainCard(
                          Icons.priority_high_rounded, 
                          // "0",
                          readyCount.toString(), 
                          "READY TO HARVEST", 
                          Colors.green.shade800,
                          Colors.white,
                          10
                        ), 
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8,20,25,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          farms.length == 0 ? "No Farms registered yet, try clicking the green circle button below!" 
                            : "Number of Coffee Farms per stage",
                          textAlign: TextAlign.left,
                          stepGranularity: 2,
                          minFontSize: 10,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        stage3Count != 0 
                          ? _card(Icons.grid_view, stage3Count.toString(), BBCH_STAGES[3], Colors.grey.shade700, Colors.white)
                          : SizedBox.shrink(),
                        stage2Count != 0 
                          ? _card(Icons.grid_view, stage2Count.toString(), BBCH_STAGES[2], Colors.grey.shade700, Colors.white)
                          : SizedBox.shrink(),
                        stage1Count != 0
                          ? _card(Icons.grid_view, stage1Count.toString(), "FLOWERING\nSTAGE", Colors.grey.shade700, Colors.white)
                          : SizedBox.shrink(),
                        stage0Count != 0
                          ? _card(Icons.grid_view, stage0Count.toString(), "INFLO\nRESCENCE", Colors.grey.shade700, Colors.white)
                          : SizedBox.shrink(),
                      ],
                    )
                  ],
                )
              )
            ),
          ],
        )
      ),
    );
  }
}
