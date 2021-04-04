import 'package:caphe_v2/router.dart' as router;
import 'package:caphe_v2/routing_constants.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CAPHE v2',
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.white,
      ),
      initialRoute: HomeScreenRoute,
      // initialRoute: LoginScreenRoute,
    );
  }
}

