import 'package:caphe_v2/routing_constants.dart';
import 'package:caphe_v2/screens/widgets/header_bar.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer (
        child: ListView(),
      ),
      appBar: HeaderBar(text: Text("CAPHE v2")),
      body: Column(
        children: <Widget>[],
        
      ),
    );
  }
}




        // children: [
        //   Text("HomeScreen"),
        //   ElevatedButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, TimelineScreenRoute);
        //     }, 
        //     child: Text("Timeline"),
        //   )
        // ],