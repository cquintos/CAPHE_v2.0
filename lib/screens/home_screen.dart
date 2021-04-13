import 'package:caphe_v2/screens/widgets/home_carousel.dart';
import 'package:caphe_v2/screens/widgets/home_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Wrap( 
          children: <Widget>[
            Container( 
              height: deviceHeight*0.43, 
              child: CarouselSection()
            )
          ]
        ),
        Expanded( child: ChartSection() ),
      ]
    );
  }
}