import 'package:flutter/material.dart';

final List <String> faqList = ["Who can I contact for additional help?", "What is the meaning of CAPHE",
  "What crop can I put in this application?", "Is this runnable in apple phones or IOS?",
  'New features in CAPHE version 2.0', 'What to do if you forgot your password?', "Where can I visit other SARAI mobile applications?"
];

final List<String> answerList = [
  "You may contact your supervisor or any SARAI mobile app developer.",
  "CAPHE means Coffee Application Harvest Estimator.",
  "The only crops you can put in this apps are the four major varieties of Coffee, Robusta, Arabica, Liberica, and Excelsa",
  "For now, the development of CAPHE is focused on a more mass friendly  mobile operating system - Android.",
  "CAPHE version 2.0 provides more pleasing User Experience and an Image processing component for easier Coffee growth stage identification.",
  "Passwords can be reset in case you forgot it. Just simply click the 'Forgot Password?' button then follow the step by step procedure",
  'Go to https://sarai.ph/ for more information regarding SARAI.'
];

class FAQ {
  FAQ({
    this.questionValue,
    this.answerValue,
    this.id
  });

  String answerValue;
  String questionValue;
  int id;
}

List<FAQ> generateItems() {
  return List<FAQ>.generate(faqList.length, (int index) {
    return FAQ(
      id:index,
      questionValue: '${faqList[index]}',
      answerValue: '${answerList[index]}',
    );
  });
}

class AboutFaq extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<FAQ> _data = generateItems();

    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList.radio(
            children: _data.map<ExpansionPanelRadio>((FAQ item) {
              return ExpansionPanelRadio(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile( 
                    title: Text(
                      item.questionValue, 
                      style: TextStyle (
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ) 
                    )
                  );
                },
                body: ListTile( title: Text(item.answerValue), ),
                canTapOnHeader: true, 
                value: item.id,
              );
            }).toList(),
          ),
        )
      )
    );
  }
}