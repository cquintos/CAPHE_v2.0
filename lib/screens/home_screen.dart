import 'package:caphe_v2/routing_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CAPHE v2"),
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