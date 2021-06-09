import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List announcementDate = [
      "March 30, 2021", "April 1, 2021", "April 2, 2021",
      "April 3, 2021", "April 15, 2021", "May 20, 2021",
      "June 10, 2021", "July 28, 2021","August 15, 2021",
      "November 18, 2021",
    ];
    List announcementInfo = [
      "CAPHE v2: Presentation of UI", "Holyweek: no class", "Holyweek: no class",
      "Holyweek: no class", "CAPHE v2: Start with image processing",
      "Final SP presentation of JC CARLO QUINTOS", "GRADUATION OF JC CARLO QUINTOS",
      "GRADUATION PARTY OF JCCCCCCCCCC","MUST HAVE JOB BY THIS DATE",
      "BDAY OF MJ CONSTANTINO"
    ];
    bool empty = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded( flex:1,
          child:  AutoSizeText(
            !empty ? "ANNOUNCEMENTS: ": "NO ANNOUNCEMENTS",
            stepGranularity: 2,
            maxLines: 1,
            maxFontSize: 50,
            minFontSize: 10,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ), 
        ),
        Expanded( flex:6,
          child: 
            !empty ? Scrollbar(
            // isAlwaysShown: true,
            child: ListView.builder(
              clipBehavior: Clip.antiAlias,
              itemCount: announcementInfo.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  height: 70,
                  child: Center(
                    child: Card(
                      elevation: 0.5,
                      color: Colors.black.withOpacity(0.3),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          '${announcementDate[index]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${announcementInfo[index]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
            ),
           ) : Center(),
        ),
      ],
    );
  }
}