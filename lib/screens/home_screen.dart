import 'package:caphe_v2/routing_constants.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer (
        child: ListView(),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("CAPHE v2"),
            Image.asset('assets/dost-pcaarrd-uplb.png', fit: BoxFit.cover,)
          ]
        ),
      ),
      body: Column(
        children: [
          Text("HomeScreen"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TimelineScreenRoute);
            }, 
            child: Text("Timeline"),
          )
        ],
      ),
    );
  }
}