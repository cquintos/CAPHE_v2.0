import 'package:caphe_v2/screens/widgets/login_background.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  final int questionNumber;
  final List<String> answerList = [
    "You may contact your supervisor or any SARAI mobile app developer.",
    "CAPHE means Coffee Application Harvest Estimator.",
    "The only crops you can put in this apps are the four major varieties of Coffee, Robusta, Arabica, Liberica, and Excelsa",
    "For now, the development of CAPHE is focused on a more mass friendly  mobile operating system - Android.",
    "CAPHE version 2.0 provides more pleasing User Experience and an Image processing component for easier Coffee growth stage identification.",
    "Passwords can be reset in case you forgot it. Just simply click the 'Forgot Password?' button then follow the step by step procedure",
  ];
  AnswerScreen({Key key, @required this.questionNumber}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("FAQ about CAPHE v2.0"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Flex(
              direction: Axis.vertical,
              children: [BackgroundSection()]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
              // height: deviceHeight*0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Wrap(
                  direction: Axis.horizontal,
                  children:[
                    Text('${answerList[questionNumber]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30),),
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}