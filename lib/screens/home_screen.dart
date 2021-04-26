import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/widgets/home_title.dart';
import 'package:caphe_v2/screens/widgets/home_carousel.dart';
import 'package:caphe_v2/screens/widgets/home_chart.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex:1, child: HomeTitle() ),
        Expanded(flex:3, child: HomeCarousel() ),
        Expanded(flex:3, child: HomeChart() ),
      ]
    );
  }
}