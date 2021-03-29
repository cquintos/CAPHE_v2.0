import 'package:caphe_v2/screens/widgets/login_announcement.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      height: deviceHeight * 0.4,
      width: deviceWidth,
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/coffee1.png"),
              fit: BoxFit.fitHeight,
            )),
          ),
          ListTile(
              title: Center(
                child: Text(
                  "C A P H E",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: deviceHeight * 0.05,
                  ),
                ),
              ),
              subtitle: Center(
                  child: Text(
                "COFFEE APP HARVEST ESTIMATOR VERSION 2.0",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ))),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "ANNOUNCEMENTS: ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: deviceHeight * 0.02,
              ),
            ),
          ),
          AnnouncementSection(),
        ],
      ),
    );
  }
}