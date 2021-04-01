import 'package:caphe_v2/screens/widgets/header_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/about_faq.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HeaderBar(text: Text("About CAPHE v2")),
      body: Column(
        children: <Widget>[
          Container (
            child: Card (
              elevation: 70.0,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText (
                  text: TextSpan(
                    children: [
                      TextSpan(text: "This application is under Project SARAI that aims for smarter agriculture in the Philippines."),
                      TextSpan(text: 'The prediction is based on the study of BM Salazar et al. in 2019, "Profiling and Analysis of Reproductive Phenology of Four Coffee species in the Philippines".'),
                      TextSpan(text: "The SARAI Coffee and Cacao team is headed by Dr. Calixto M. Protacio of institute of Crop Science, College of Agriculture and Food Sciences, UP Los Baños."),
                    ],
                    style: TextStyle(color: Colors.black)
                  )
                ),
              ),
            )
          ),
          Expanded( 
            child: FaqSection()
          ),
        ],
      ),
    );
  }
}