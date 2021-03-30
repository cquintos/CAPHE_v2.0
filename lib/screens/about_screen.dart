import 'package:caphe_v2/screens/widgets/login_background.dart';
import 'package:flutter/material.dart';

import 'answer_screen.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List faqList = ["Who can I contact for additional help?", "What is the meaning of CAPHE",
      "What crop can I put in this application?", "Is this runnable in apple phones or IOS?",
      'New features in CAPHE version 2.0', 'What to do if you forgot your password?',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("About CAPHE v2"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Flex(
              direction: Axis.vertical,
              children: [
                BackgroundSection(),
              ]
            ),
            Column(
              children: <Widget>[
                Container (
                  // color: Colors.black.withOpacity(0.2),
                  child: Card (
                    color: Colors.black.withOpacity(0.2),
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText  (
                        text: TextSpan(
                          children: [
                            TextSpan(text: "This application is under Project SARAI that aims for smarter agriculture in the Philippines."),
                            TextSpan(text: 'The prediction is based on the study of BM Salazar et al. in 2019, "Profiling and Analysis of Reproductive Phenology of Four Coffee species in the Philippines".'),
                            TextSpan(text: "The SARAI Coffee and Cacao team is headed by Dr. Calixto M. Protacio of institute of Crop Science, College of Agriculture and Food Sciences, UP Los Baños."),
                          ],
                          style: TextStyle(color: Colors.white)
                        )
                      ),
                    ),
                  )
                ),
                Expanded( 
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemCount: faqList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AnswerScreen (questionNumber: index,)));},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1.0, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Center(child: Text('${faqList[index]}')),
                                  Icon(Icons.forward),
                                ],
                              ),
                            ),
                          ), 
                        );
                      },   
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
